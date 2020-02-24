import os
import pirf_rfm9x
import argparse
import board
import digitalio
import time
import spidev
import picamera
from gps import *
from lora_xfer import *


def get_gps(gpsd):
    while True:
        report = gpsd.next()
        if report['class'] == 'TPV':
            print(report)
            latitude  = report['lat']
            longitude = report['lon']
            #alt       = report['alt']
            break;
    return latitude, longitude, 0

def main():
    infoStr = """Script to test lora"""
    parser = argparse.ArgumentParser(description=infoStr)
    parser.add_argument('-f', '--freq',
                        type=float,
                        default=915.0,
                        help="RF Frequency in Mhz")
    parser.add_argument('-p', '--power',
                        type=int,
                        default=23,
                        help="Power to transmit in dB (23-5)")
    parser.add_argument('-d', '--delay',
                        type=float,
                        default=1,
                        help="Delay between transmit packets")
    parser.add_argument('-b', '--baudrate',
                        type=int,
                        default=10000000,
                        help="Default baud rate")
    parser.add_argument('--server',
                        action='store_true',
                        help="This unit will transmit images")
    parser.add_argument('--pirfhat',
                        action='store_true',
                        help="Set if you are using the PiRfHat")
    parser.add_argument('--cap_delay',
                        type=int,
                        default=5,
                        help="Delay between image captures")
    parser.add_argument('-q', '--quality',
                        type=int,
                        default=800000,
                        help="Compression quality for the HEVC")
    args = parser.parse_args()

    if args.pirfhat:
        PWR = digitalio.DigitalInOut(board.D4)
        RESET = digitalio.DigitalInOut(board.D6)
        spibus = spidev.SpiDev()
        # The PiRfHat is connected to SPI1, but not to any of the SPI CS
        spibus.open(1, 2)
        spibus.max_speed_hz = args.baudrate
        spibus.cshigh = False
        CS = digitalio.DigitalInOut(board.D8)
    else:
        PWR = digitalio.DigitalInOut(board.D23)
        RESET = digitalio.DigitalInOut(board.D24)
        spibus = spidev.SpiDev()
        spibus.open(0, 1)
        spibus.max_speed_hz = args.baudrate
        spibus.cshigh = False
        CS = None

    PWR.switch_to_output()
    PWR.value = True
    # Initialze RFM radio
    rfm9x = pirf_rfm9x.RFM9x(spibus, CS, RESET, args.freq)

    # You can however adjust the transmit power (in dB).  The default is 13 dB but
    # high power radios like the RFM95 can go up to 23 dB:
    rfm9x.tx_power = args.power
    rfm9x.enable_crc = True
    rfm9x.signal_bandwidth = 500000
    rfm9x.spreading_factor = 7

    xfer = lora_xfer(rfm9x)

    if args.server:
        gpsd = gps(mode=WATCH_ENABLE)
        with picamera.PiCamera() as camera:
            #camera.resolution = (3280, 2464)
            camera.resolution = (640, 480)
            camera.hflip = True
            camera.vflip = True
            while True:
                time.sleep(args.cap_delay)
                print("Getting GPS")
                latitude, longitude, alt = get_gps(gpsd)
                print("Got GPS")
                img_str = "{}\n{} {} {}".format(time.asctime(), latitude, longitude, alt)
                camera.annotate_text = img_str
                camera.annotate_background = picamera.Color(r=0, g=0, b=0)
                camera.capture("cap.jpg")
                #compression_str = "ffmpeg -y -i cap.jpg -b:v {} cap.hevc".format(args.quality)
                compression_str = "ffmpeg -y -i cap.jpg cap.webm"
                os.system(compression_str)
                xfer.send_file("cap.webm")
    else:
        while True:
            xfer.receive_file("cap.webm", args.delay)
            decompression_str = "ffmpeg -y -i cap.webm cap.jpg"
            os.system(decompression_str)

if __name__ == "__main__":
    # execute only if run as a script
    main()
