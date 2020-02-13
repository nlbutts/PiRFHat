import pirf_rfm9x
import argparse
import board
import busio
import digitalio
import time
import struct
import spidev

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
                        default=1000000,
                        help="Default baud rate")
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
