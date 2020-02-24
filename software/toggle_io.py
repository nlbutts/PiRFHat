import os
import argparse
import board
import busio
import digitalio
import time

infoStr = """Script to toggle IO"""
parser = argparse.ArgumentParser(description=infoStr)
parser.add_argument('-p', '--power',
                    type=int,
                    default=1,
                    help="Toggle power on/off")
args = parser.parse_args()

PWR = digitalio.DigitalInOut(board.D4)
HAT_PG = digitalio.DigitalInOut(board.D17)
HAT_PG.switch_to_input()
GPS_RESET = digitalio.DigitalInOut(board.D22)
GPS_RESET.switch_to_output()
RFM_RESET = digitalio.DigitalInOut(board.D6)
RFM_RESET.switch_to_output()
PI_LED2 = digitalio.DigitalInOut(board.D24)
PI_LED2.switch_to_output()
PI_LED1 = digitalio.DigitalInOut(board.D10)
PI_LED1.switch_to_output()

MOSI = digitalio.DigitalInOut(board.D20)
MOSI.switch_to_output()
SCLK = digitalio.DigitalInOut(board.D21)
SCLK.switch_to_output()
MISO = digitalio.DigitalInOut(board.D19)
MISO.switch_to_output()
SS = digitalio.DigitalInOut(board.D8)
SS.switch_to_output()

PWR.switch_to_output()
if args.power == 1:
    PWR.value = True
else:
    PWR.value = False

GPS_RESET = True

while True:
    print("Waiting")
    time.sleep(1)

