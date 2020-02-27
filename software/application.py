from flask_socketio import SocketIO, emit
from flask import Flask, render_template, url_for, copy_current_request_context
from random import random
from time import sleep
from threading import Thread, Event
import pirf_rfm9x
from lora_xfer import *
import argparse
import os
import digitalio
import spidev
import board

__author__ = 'nlbutts'

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
app.config['DEBUG'] = True

#turn the flask app into a socketio app
socketio = SocketIO(app, async_mode=None, logger=True, engineio_logger=True)

#random number Generator Thread
thread = Thread()
thread_stop_event = Event()

class LoraRx(Thread):
    def __init__(self, freq, delay, pirfhat):
        Thread.__init__(self)
        if args.pirfhat:
            print("Setting up for PiRFHat")
            self.PWR = digitalio.DigitalInOut(board.D4)
            self.RESET = digitalio.DigitalInOut(board.D6)
            self.spibus = spidev.SpiDev()
            # The PiRfHat is connected to SPI1, but not to any of the SPI CS
            self.spibus.open(1, 2)
            self.spibus.max_speed_hz = args.baudrate
            self.spibus.cshigh = False
            self.CS = digitalio.DigitalInOut(board.D8)
            global lorathread
            lorathread = True
        else:
            print("Setting up for Adafruit RFM9x")
            self.PWR = digitalio.DigitalInOut(board.D23)
            self.RESET = digitalio.DigitalInOut(board.D24)
            self.spibus = spidev.SpiDev()
            self.spibus.open(0, 1)
            self.spibus.max_speed_hz = args.baudrate
            self.spibus.cshigh = False
            self.CS = None

        self.PWR.switch_to_output()
        self.PWR.value = True
        # Initialze RFM radio
        self.rfm9x = pirf_rfm9x.RFM9x(self.spibus, self.CS, self.RESET, freq)

        # You can however adjust the transmit power (in dB).  The default is 13 dB but
        # high power radios like the RFM95 can go up to 23 dB:
        self.rfm9x.enable_crc = True
        self.rfm9x.signal_bandwidth = 500000
        self.rfm9x.spreading_factor = 7

        self.xfer = lora_xfer(self.rfm9x)

        self.delay = delay

    def run(self):
        print("***Starting LoraRX Thread")
        last_img = 0
        prev_rssi = 0
        prev_snr = 0
        while True:
            ret, rssi, snr = self.xfer.receive_file("cap.webm", self.delay)
            if ret:
                last_img = 0
                prev_rssi = rssi
                prev_snr = snr
                decompression_str = "ffmpeg -y -i cap.webm static/img.jpg"
                os.system(decompression_str)
                d = {}
                d['number'] = last_img
                d['rssi'] = round(rssi, 1)
                d['snr'] = round(snr, 1)
                socketio.emit('newnumber', d, namespace='/test')
            else:
                d = {}
                last_img += self.delay
                d['number'] = last_img
                d['rssi'] = prev_rssi
                d['snr'] = prev_snr
                socketio.emit('newnumber', d, namespace='/test')


# def randomNumberGenerator():
#     """
#     Generate a random number every 1 second and emit to a socketio instance (broadcast)
#     Ideally to be run in a separate thread?
#     """
#     #infinite loop of magical random numbers
#     print("Making random numbers")
#     while not thread_stop_event.isSet():
#         number = round(random()*10, 3)
#         #socketio.emit('newnumber', {'number': number}, namespace='/test')
#         socketio.sleep(1)


@app.route('/')
def index():
    #only by sending this page first will the client be connected to the socketio instance
    return render_template('index.html')

@socketio.on('connect', namespace='/test')
def test_connect():
    # need visibility of the global thread object
    global thread
    print('Client connected')

    #Start the random number generator thread only if the thread has not been started before.
    # if not thread.isAlive():
    #     print("Starting Thread")
    #     thread = socketio.start_background_task(randomNumberGenerator)

@socketio.on('disconnect', namespace='/test')
def test_disconnect():
    print('Client disconnected')


if __name__ == '__main__':
    infoStr = """LoRa image transfer client"""
    parser = argparse.ArgumentParser(description=infoStr)
    parser.add_argument('-f', '--freq',
                        type=float,
                        default=915.0,
                        help="RF Frequency in Mhz")
    parser.add_argument('-d', '--delay',
                        type=float,
                        default=1,
                        help="Delay between transmit packets")
    parser.add_argument('-b', '--baudrate',
                        type=int,
                        default=10000000,
                        help="Default baud rate")
    parser.add_argument('--pirfhat',
                        action='store_true',
                        help="Set if you are using the PiRfHat")
    args = parser.parse_args()

    lrx = LoraRx(args.freq, args.delay, args.pirfhat)
    lrx.start()
    socketio.run(app, host="0.0.0.0", use_reloader=False)
