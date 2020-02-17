import os
import pirf_rfm9x
import argparse
import board
import busio
import digitalio
import time
import struct
import spidev
import binascii
import picamera

def send_file(rfm9x, sendfile, max_payload = 200):
    print("Sending file {}".format(sendfile))
    f = open(sendfile, "rb")
    x = f.read()

    chunks = (len(x) // max_payload) + 1
    print(len(x))
    print(chunks)
    sequence_counter = 0
    offset = 0
    command = 0
    crc = binascii.crc32(x)

    while offset < len(x):
        if command == 0:
            sn = bytearray(struct.pack("<HIII", command, sequence_counter, len(x), crc))
        else:
            sn = bytearray(struct.pack("<HI", command, sequence_counter))
        packet_size = min(max_payload, len(x) - offset)
        payload = x[offset:offset+packet_size]
        packet = sn + payload
        sequence_counter += 1
        if command == 0:
            command = 1
        offset += packet_size
        print(binascii.hexlify(sn))
        rfm9x.send(packet)

def receive_file(rfm9x, receivefile, delay):
    done = False
    sequence = 0
    filedata = []
    bytes_received = 0
    print("Receiving file")
    while not done:
        packet = rfm9x.receive(timeout=delay * 4)
        if packet is None:
            print("Timeout")
        elif packet[0] == 0:
            sn, total_bytes, expected_crc = struct.unpack("<III", packet[2:14])
            print("Receiving file of size {} SN: {}".format(total_bytes, sn))
            data = packet[14::]
            # We received the correct sequence number, put into array
            f = open(receivefile, "wb")
            f.write(data)
            sequence = 1
            bytes_received = len(data)
        elif packet[0] == 1:
            sn = struct.unpack("<i", packet[2:6])[0]
            data = packet[6::]
            if sn == sequence:
                # We received the correct sequence number, put into array
                f.write(data)
                sequence += 1
                bytes_received += len(data)
                if bytes_received >= total_bytes:
                    done = True
                    # Check the CRC
                    f.close()
                    f = open(receivefile, "rb")
                    x = f.read()
                    f.close()
                    calc_crc = binascii.crc32(x)
                    if calc_crc != expected_crc:
                        print("Error: CRC doesn't match, file correctup")
                else:
                    rssi = rfm9x.rssi
                    snr = rfm9x.snr
                    percent_complete = round((bytes_received / total_bytes) * 100, 1)
                    print("SN: {} RSSI: {:3} SNR: {:5.2f} Percent complete: {}".format(sn, rssi, snr, percent_complete))

            else:
                print("Error: wrong sequence number. Expected {} Received {}".format(sequence, sn))
                print(binascii.hexlify(packet))

        else:
            print("Error: invalid command")
            print(binascii.hexlify(packet))


def main():
    infoStr = """Script to test lora"""
    parser = argparse.ArgumentParser(description=infoStr)
    parser.add_argument('-f', '--freq',
                        type=float,
                        default=915.0,
                        help="RF Frequency in Mhz")
    parser.add_argument('-n', '--number_of_messages',
                        type=int,
                        default=-1,
                        help="Max number of messages to transmit")
    parser.add_argument('-r', '--rx',
                        action='store_true',
                        default=False,
                        help="Define to receive instead of transmit")
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
                        default=30,
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

    if args.server:
        with picamera.PiCamera() as camera:
            #camera.resolution = (3280, 2464)
            camera.resolution = (640, 480)
            camera.hflip = True
            camera.vflip = True
            while True:
                camera.annotate_text = time.asctime()
                camera.annotate_background = picamera.Color(r=0, g=0, b=0)
                #camera.annotate_text_size = 48
                camera.capture("cap.jpg")
                compression_str = "ffmpeg -y -i cap.jpg -b:v {} cap.hevc".format(args.quality)
                os.system(compression_str)
                #os.system("ffmpeg -y -i cap.jpg -b:v 1M cap.hevc")
                time.sleep(args.cap_delay)
                send_file(rfm9x, "cap.hevc")
    else:
        while True:
            receive_file(rfm9x, "cap.hevc", args.delay)

if __name__ == "__main__":
    # execute only if run as a script
    main()
