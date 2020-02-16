import pirf_rfm9x
import argparse
import board
import busio
import digitalio
import time
import struct
import spidev
import binascii

def calculate_ber(total_bits, error_bits, packet, expected_msg):

    total_bits += (len(expected_msg) * 8)
    min_bytes = min(len(packet), len(expected_msg))
    for i in range(0, min_bytes):
        a = packet[i]
        b = expected_msg[i]
        for bit in range(0, 8):
            mask = 1 << bit
            if (a & mask) != (b & mask):
                error_bits += 1

    return total_bits, error_bits

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
    f = open(receivefile, "wb")

    print("Receiving file")
    while not done:
        packet = rfm9x.receive(timeout=delay * 4)
        if packet is None:
            print("Timeout")
        elif packet[0] == 0:
            sn, total_bytes, expected_crc = struct.unpack("<III", packet[2:14])
            print("Receiving file of size {} SN: {}".format(total_bytes, sn))
            data = packet[14::]
            if sn == sequence:
                # We received the correct sequence number, put into array
                f.write(data)
                sequence += 1
                bytes_received = len(data)
            else:
                print("Error with the start transmission packet and sequence number")
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
                    percent_complete = round((bytes_received / total_bytes) * 100, 1)
                    print("SN: {} Percent complete: {}".format(sn, percent_complete))

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
    parser.add_argument('-m', '--message',
                        type=str,
                        default="Hello World",
                        help="String to transmit")
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
    parser.add_argument('--sendfile',
                        type=str,
                        help="File to transfer")
    parser.add_argument('--receivefile',
                        type=str,
                        help="Receive a file and save it to this file name")
    parser.add_argument('--pirfhat',
                        action='store_true',
                        help="Set if you are using the PiRfHat")
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

    # Note that the radio is configured in LoRa mode so you can't control sync
    # word, encryption, frequency deviation, or other settings!

    # You can however adjust the transmit power (in dB).  The default is 13 dB but
    # high power radios like the RFM95 can go up to 23 dB:
    rfm9x.tx_power = args.power
    rfm9x.enable_crc = True

    if args.sendfile is not None:
        send_file(rfm9x, args.sendfile)
    elif args.receivefile is not None:
        receive_file(rfm9x, args.receivefile, args.delay)
    else:
        # Send a packet.  Note you can only send a packet up to 252 bytes in length.
        # This is a limitation of the radio packet size, so if you need to send larger
        # amounts of data you will need to break it into smaller send calls.  Each send
        # call will wait for the previous one to finish before continuing.
        number_of_messages = args.number_of_messages
        if args.rx:
            # Receive messages
            # Wait to receive packets.  Note that this library can't receive data at a fast
            # rate, in fact it can only receive and process one 252 byte packet at a time.
            # This means you should only use this for low bandwidth scenarios, like sending
            # and receiving a single message at a time.
            print('Waiting for packets...')

            total_bits = 0
            error_bits = 0
            expected_msg = bytes(args.message, "utf-8")
            total_packets = 0
            packet_error = 0
            prev_sn = -1

            while True:
                packet = rfm9x.receive(timeout=args.delay * 4)
                # Optionally change the receive timeout from its default of 0.5 seconds:
                #packet = rfm9x.receive(timeout=5.0)
                # If no packet was received during the timeout then None is returned.
                if packet is None:
                    # Packet has not been received
                    print('Received nothing! Listening again...')
                else:
                    # And decode to ASCII text and print it too.  Note that you always
                    # receive raw bytes and need to convert to a text format like ASCII
                    # if you intend to do string processing on your data.  Make sure the
                    # sending side is sending ASCII data before you try to decode!
                    #packet_text = str(packet, 'ascii')
                    #print('Received (ASCII): {0}'.format(packet_text))
                    # Also read the RSSI (signal strength) of the last received message and
                    # print it.
                    rssi = rfm9x.rssi
                    snr = rfm9x.snr
                    # Extract the sequence number
                    sn = packet[0:4]
                    sn = struct.unpack("i", sn)[0]
                    data = packet[4::]
                    if (prev_sn > 0) and (sn != (prev_sn + 1)):
                        packet_error += 1
                        total_bits += len(expected_msg) * 8
                        error_bits += len(expected_msg) * 8
                    else:
                        total_bits, error_bits = calculate_ber(total_bits, error_bits, data, expected_msg)
                    total_packets += 1
                    prev_sn = sn

                    print('RSSI: {} dB ** snr: {} ** SN: {} ** raw: {}'.format(rssi, snr, sn, data))

                    if (number_of_messages != -1) and (total_packets >= number_of_messages):
                        break

            print("Total bits: {} - error bits: {} - BER: {}".format(total_bits, error_bits, error_bits / total_bits))
            print("Total packets: {} - error packets: {} - PER: {}".format(total_packets, packet_error, packet_error / total_packets))

        else:
            sequence_counter = 0
            msg = bytes(args.message, "utf-8")
            while True:
                sn = bytearray(struct.pack("i", sequence_counter))
                for v in msg:
                    sn.append(v)
                sequence_counter += 1
                rfm9x.send(sn)
                print('Sent message {}!'.format(sn))
                time.sleep(args.delay)

                if (number_of_messages != -1) and (sequence_counter >= number_of_messages):
                    break

            print("Done sending");

if __name__ == "__main__":
    # execute only if run as a script
    main()
