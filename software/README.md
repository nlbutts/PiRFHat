# PiRFHat
This project is a Pi Hat that incorporates an ST Teseo GPS receiver and a RFM9x LoRa module.

# GPS
The GPS receiver uses gpsd and is pretty straigtforward to get setup
```
apt-get install gpsd
```

Next modify **/lib/systemd/system/gpsd.service** and change the following file:
```
ExecStart=/usr/sbin/gpsd $GPSD_OPTIONS /dev/ttyS0
```

TBD working on Python code to send and receive data

# LoRa

The rf_testing.py file is a simple command line system to run BER and PER tests between two devices. It also supports simple file transfer.

## BER

To perform BER testing on the receiver do the following:
```
python rf_testing.py -n 100 -r --pirfhat
```

On the transmit do the following:
```
python rf_testing.py --pirfhat --delay=0.01
```

This will transmit 100 messages then the receiver will exit and print the BER and PER.

## File Transfer
```
python rf_testing.py --pirfhat --receivefile foo.bar
```

```
python rf_testing.py --pirfhat --sendfile foo.bar
```

# File Transfer Protocol
The file transfer protocol is very simple. You can use the LoRa header to address a particular node. The file transfer payload is defined below:

| Command | Sequence number | Payload |
| ------- | ----------------| --------- |
| Start Command (0) | Sequence Number | Bytes to transfer | 32-bit CRC | Data |
| Continuous Trasnfer (1) | Sequence Number | Data |


The **Sequence Number** is a monotonically increasing 32-bit number that indicates which packet this is.

