import binascii
import struct


class lora_xfer:
    def __init__(self, rfm9x):
        self.rfm9x = rfm9x

    def send_file(self, sendfile, max_payload = 200):
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
            self.rfm9x.send(packet)

    def receive_file(self, receivefile, delay):
        done = False
        sequence = 0
        filedata = []
        bytes_received = 0
        print("Receiving file")
        while not done:
            packet = self.rfm9x.receive(timeout=delay * 4)
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
                        rssi = self.rfm9x.rssi
                        snr = self.rfm9x.snr
                        percent_complete = round((bytes_received / total_bytes) * 100, 1)
                        print("SN: {} RSSI: {:3} SNR: {:5.2f} Percent complete: {}".format(sn, rssi, snr, percent_complete))

                else:
                    print("Error: wrong sequence number. Expected {} Received {}".format(sequence, sn))
                    print(binascii.hexlify(packet))

            else:
                print("Error: invalid command")
                print(binascii.hexlify(packet))
