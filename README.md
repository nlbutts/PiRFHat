# PiRFHat
This project is a Pi Hat that incorporates an ST Teseo GPS receiver and a RFM9x LoRa module.

The GPS receiver uses gpsd and is pretty straigtforward to get setup
```
apt-get install gpsd
```

Next modify **/lib/systemd/system/gpsd.service** and change the following file:
```
ExecStart=/usr/sbin/gpsd $GPSD_OPTIONS /dev/ttyS0
```

TBD working on Python code to send and receive data