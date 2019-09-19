EESchema Schematic File Version 4
LIBS:PiRF-cache
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Raspberry Pi HAT"
Date ""
Rev "A"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Mechanical:MountingHole H3
U 1 1 5834BC4A
P 5650 6000
F 0 "H3" H 5500 6100 60  0000 C CNN
F 1 "3mm_Mounting_Hole" H 5650 5850 60  0000 C CNN
F 2 "project_footprints:NPTH_3mm_ID" H 5550 6000 60  0001 C CNN
F 3 "" H 5550 6000 60  0001 C CNN
	1    5650 6000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5834BCDF
P 6650 6000
F 0 "H6" H 6500 6100 60  0000 C CNN
F 1 "3mm_Mounting_Hole" H 6650 5850 60  0000 C CNN
F 2 "project_footprints:NPTH_3mm_ID" H 6550 6000 60  0001 C CNN
F 3 "" H 6550 6000 60  0001 C CNN
	1    6650 6000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5834BD62
P 5650 6550
F 0 "H4" H 5500 6650 60  0000 C CNN
F 1 "3mm_Mounting_Hole" H 5650 6400 60  0000 C CNN
F 2 "project_footprints:NPTH_3mm_ID" H 5550 6550 60  0001 C CNN
F 3 "" H 5550 6550 60  0001 C CNN
	1    5650 6550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H8
U 1 1 5834BDED
P 6700 6550
F 0 "H8" H 6550 6650 60  0000 C CNN
F 1 "3mm_Mounting_Hole" H 6700 6400 60  0000 C CNN
F 2 "project_footprints:NPTH_3mm_ID" H 6600 6550 60  0001 C CNN
F 3 "" H 6600 6550 60  0001 C CNN
	1    6700 6550
	1    0    0    -1  
$EndComp
Text Label 3150 7400 2    60   ~ 0
HAT_3V3
$Comp
L PiRF-rescue:CAT24C32-raspberrypi_hat U1
U 1 1 58E1713F
P 2100 5850
F 0 "U1" H 2450 6200 50  0000 C CNN
F 1 "CAT24C32" H 1850 6200 50  0000 C CNN
F 2 "Package_SOIC:SOIC-8_3.9x4.9mm_P1.27mm" H 2100 5850 50  0001 C CNN
F 3 "" H 2100 5850 50  0000 C CNN
	1    2100 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 58E17715
P 2350 7400
F 0 "R3" V 2430 7400 50  0000 C CNN
F 1 "3.9K" V 2350 7400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.84x1.00mm_HandSolder" V 2280 7400 50  0001 C CNN
F 3 "" H 2350 7400 50  0001 C CNN
	1    2350 7400
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 58E17720
P 2350 7650
F 0 "R4" V 2430 7650 50  0000 C CNN
F 1 "3.9K" V 2350 7650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.84x1.00mm_HandSolder" V 2280 7650 50  0001 C CNN
F 3 "" H 2350 7650 50  0001 C CNN
	1    2350 7650
	0    1    1    0   
$EndComp
Wire Wire Line
	1250 7400 2150 7400
Wire Wire Line
	1250 7650 2150 7650
Wire Wire Line
	2150 7500 1250 7500
Wire Wire Line
	2150 7750 1250 7750
Wire Wire Line
	2150 7750 2150 7650
Connection ~ 2150 7650
Wire Wire Line
	2150 7500 2150 7400
Connection ~ 2150 7400
Wire Wire Line
	2500 7400 2700 7400
Wire Wire Line
	2700 7650 2500 7650
Connection ~ 2700 7400
Text Label 1250 7400 0    60   ~ 0
ID_SD_EEPROM_pu
Text Label 1250 7500 0    60   ~ 0
ID_SD_EEPROM
Text Label 1250 7650 0    60   ~ 0
ID_SC_EEPROM_pu
Text Label 1250 7750 0    60   ~ 0
ID_SC_EEPROM
Wire Wire Line
	3450 6050 2600 6050
Wire Wire Line
	2600 5950 3450 5950
Text Label 3450 6050 2    60   ~ 0
ID_SD_EEPROM_pu
Text Label 3450 5950 2    60   ~ 0
ID_SC_EEPROM_pu
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 58E18D32
P 750 6100
F 0 "J1" H 750 6250 50  0000 C CNN
F 1 "CONN_01X02" V 850 6100 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 750 6100 50  0001 C CNN
F 3 "" H 750 6100 50  0000 C CNN
	1    750  6100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 58E19E51
P 1550 6250
F 0 "R2" V 1630 6250 50  0000 C CNN
F 1 "10K" V 1550 6250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.84x1.00mm_HandSolder" V 1480 6250 50  0001 C CNN
F 3 "" H 1550 6250 50  0001 C CNN
	1    1550 6250
	-1   0    0    1   
$EndComp
Text Label 2400 5350 2    60   ~ 0
HAT_3V3
Wire Wire Line
	2100 5350 2400 5350
Wire Wire Line
	2100 5350 2100 5450
$Comp
L power:GND #PWR01
U 1 1 58E1A612
P 1050 5750
F 0 "#PWR01" H 1050 5500 50  0001 C CNN
F 1 "GND" H 1050 5600 50  0000 C CNN
F 2 "" H 1050 5750 50  0000 C CNN
F 3 "" H 1050 5750 50  0000 C CNN
	1    1050 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 5650 1300 5750
Wire Wire Line
	1050 5650 1300 5650
Wire Wire Line
	1600 5750 1300 5750
Connection ~ 1300 5750
Wire Wire Line
	1300 5850 1600 5850
Text Notes 3250 5350 0    60   ~ 0
EEPROM WRITE ENABLE
$Comp
L Device:R R1
U 1 1 58E22900
P 1300 6100
F 0 "R1" V 1380 6100 50  0000 C CNN
F 1 "DNP" V 1300 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.84x1.00mm_HandSolder" V 1230 6100 50  0001 C CNN
F 3 "" H 1300 6100 50  0001 C CNN
	1    1300 6100
	0    1    1    0   
$EndComp
Text Notes 1550 7050 0    118  ~ 24
Pullup Resistors
Text Notes 2000 4800 0    118  ~ 24
HAT EEPROM
Text Notes 5300 5700 0    118  ~ 24
Mounting Holes
Text Notes 1650 2000 0    118  ~ 24
40-Pin HAT Connector
Text Label 800  4150 0    60   ~ 0
GND
Wire Wire Line
	2000 4150 800  4150
Text Label 800  3550 0    60   ~ 0
ID_SD_EEPROM
Wire Wire Line
	2000 3550 800  3550
Text Label 800  3450 0    60   ~ 0
GND
Wire Wire Line
	2000 3450 800  3450
Text Label 800  2650 0    60   ~ 0
GND
Wire Wire Line
	2000 2650 800  2650
Wire Wire Line
	3200 2850 4400 2850
Wire Wire Line
	3200 3150 4400 3150
Wire Wire Line
	3200 3550 4400 3550
Wire Wire Line
	3200 3650 4400 3650
Wire Wire Line
	3200 3850 4400 3850
Text Label 4400 2850 2    60   ~ 0
GND
Text Label 4400 3150 2    60   ~ 0
GND
Text Label 4400 3650 2    60   ~ 0
GND
Text Label 4400 3550 2    60   ~ 0
ID_SC_EEPROM
Text Label 4400 3850 2    60   ~ 0
GND
Text Label 4400 2450 2    60   ~ 0
GND
Wire Wire Line
	3200 2450 4400 2450
Text Label 4400 2350 2    60   ~ 0
P5V_HAT
Text Label 4400 2250 2    60   ~ 0
P5V_HAT
Wire Wire Line
	2700 7650 2700 7400
Text Notes 1100 7250 0    60   ~ 0
These are just pullup resistors for the I2C bus on the EEPROM.\nThe resistor values are per the HAT spec.
Text Notes 850  1250 0    100  ~ 0
This is based on the official Raspberry Pi spec to be able to call an extension board a HAT.\nhttps://github.com/raspberrypi/hats/blob/master/designguide.md
Wire Wire Line
	2100 6250 2100 6350
Text Label 1800 6550 2    60   ~ 0
HAT_3V3
Wire Wire Line
	1800 6550 1550 6550
Wire Wire Line
	1550 6550 1550 6400
Wire Wire Line
	1450 6050 1550 6050
Wire Wire Line
	1550 6000 1550 6050
Wire Wire Line
	1050 5650 1050 5750
Connection ~ 1300 5650
Wire Wire Line
	1450 6050 1450 6100
Connection ~ 1550 6050
Wire Wire Line
	950  6100 1050 6100
Wire Wire Line
	1050 6150 1050 6100
Connection ~ 1050 6100
Wire Wire Line
	950  6000 1550 6000
Wire Wire Line
	2150 7650 2200 7650
Wire Wire Line
	2150 7400 2200 7400
Wire Wire Line
	2700 7400 3150 7400
Wire Wire Line
	1300 5750 1300 5850
Wire Wire Line
	1300 5650 1600 5650
Wire Wire Line
	1550 6050 1600 6050
Wire Wire Line
	1550 6050 1550 6100
Wire Wire Line
	1050 6100 1150 6100
$Comp
L General:TPS7A19 U2
U 1 1 5D7EFAC4
P 12000 7350
F 0 "U2" H 12000 7787 60  0000 C CNN
F 1 "TPS7A19" H 12000 7681 60  0000 C CNN
F 2 "Package_SON:Texas_S-PVSON-N8_ThermalVias" H 12000 7350 60  0001 C CNN
F 3 "" H 12000 7350 60  0001 C CNN
F 4 "296-45026-1-ND" H 12000 7350 50  0001 C CNN "Digikey"
F 5 "TPS7A1901DRBT" H 12000 7350 50  0001 C CNN "Partnum"
	1    12000 7350
	1    0    0    -1  
$EndComp
Text Notes 1200 5200 0    60   ~ 0
The HAT spec requires this EEPROM with system information\nto be in place in order to be called a HAT. It should be set up as write\nprotected (WP pin held high), so it may be desirable to either put a \njumper as shown to enable writing, or to hook up a spare IO pin to do so.
$Comp
L Device:C C2
U 1 1 5D7F7777
P 11050 7950
F 0 "C2" H 11165 7996 50  0000 L CNN
F 1 "0.1u" H 11165 7905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 11088 7800 50  0001 C CNN
F 3 "~" H 11050 7950 50  0001 C CNN
F 4 "490-1532-1-ND" H 11050 7950 50  0001 C CNN "Digikey"
F 5 "GRM188R71C104KA01D" H 11050 7950 50  0001 C CNN "Partnum"
	1    11050 7950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5D7F8093
P 10550 7950
F 0 "C1" H 10665 7996 50  0000 L CNN
F 1 "10u" H 10665 7905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10588 7800 50  0001 C CNN
F 3 "~" H 10550 7950 50  0001 C CNN
F 4 "490-5523-1-ND" H 10550 7950 50  0001 C CNN "Digikey"
F 5 "GRM21BR61E106KA73L" H 10550 7950 50  0001 C CNN "Partnum"
	1    10550 7950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 5D7F8C0E
P 13200 7450
F 0 "R14" H 13270 7496 50  0000 L CNN
F 1 "15.8k" H 13270 7405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 13130 7450 50  0001 C CNN
F 3 "~" H 13200 7450 50  0001 C CNN
	1    13200 7450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5D7F9729
P 13200 8000
F 0 "R15" H 13270 8046 50  0000 L CNN
F 1 "9.53k" H 13270 7955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 13130 8000 50  0001 C CNN
F 3 "~" H 13200 8000 50  0001 C CNN
	1    13200 8000
	1    0    0    -1  
$EndComp
Wire Wire Line
	12650 7300 13200 7300
Wire Wire Line
	13200 7300 13800 7300
Wire Wire Line
	13800 7300 13800 7450
Connection ~ 13200 7300
Wire Wire Line
	13200 7600 13200 7700
$Comp
L power:GND #PWR014
U 1 1 5D7FCE1E
P 13200 8400
F 0 "#PWR014" H 13200 8150 50  0001 C CNN
F 1 "GND" H 13205 8227 50  0000 C CNN
F 2 "" H 13200 8400 50  0001 C CNN
F 3 "" H 13200 8400 50  0001 C CNN
	1    13200 8400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5D7FD16F
P 11050 8350
F 0 "#PWR09" H 11050 8100 50  0001 C CNN
F 1 "GND" H 11055 8177 50  0000 C CNN
F 2 "" H 11050 8350 50  0001 C CNN
F 3 "" H 11050 8350 50  0001 C CNN
	1    11050 8350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5D7FD4B3
P 10550 8350
F 0 "#PWR06" H 10550 8100 50  0001 C CNN
F 1 "GND" H 10555 8177 50  0000 C CNN
F 2 "" H 10550 8350 50  0001 C CNN
F 3 "" H 10550 8350 50  0001 C CNN
	1    10550 8350
	1    0    0    -1  
$EndComp
Wire Wire Line
	11350 7650 11050 7650
Wire Wire Line
	11050 7650 11050 7800
Wire Wire Line
	11050 8100 11050 8350
Wire Wire Line
	10550 8100 10550 8350
Wire Wire Line
	10550 7800 10550 7200
Wire Wire Line
	10550 7200 11350 7200
Wire Wire Line
	13200 8150 13200 8400
$Comp
L power:GND #PWR017
U 1 1 5D802AAA
P 13800 8400
F 0 "#PWR017" H 13800 8150 50  0001 C CNN
F 1 "GND" H 13805 8227 50  0000 C CNN
F 2 "" H 13800 8400 50  0001 C CNN
F 3 "" H 13800 8400 50  0001 C CNN
	1    13800 8400
	1    0    0    -1  
$EndComp
Wire Wire Line
	13800 7850 13800 8100
Wire Wire Line
	12650 7400 13000 7400
Wire Wire Line
	13000 7400 13000 7700
Wire Wire Line
	13000 7700 13200 7700
Connection ~ 13200 7700
Wire Wire Line
	13200 7700 13200 7850
$Comp
L power:GND #PWR013
U 1 1 5D8053B3
P 12750 7900
F 0 "#PWR013" H 12750 7650 50  0001 C CNN
F 1 "GND" H 12755 7727 50  0000 C CNN
F 2 "" H 12750 7900 50  0001 C CNN
F 3 "" H 12750 7900 50  0001 C CNN
	1    12750 7900
	1    0    0    -1  
$EndComp
Wire Wire Line
	12650 7500 12750 7500
Wire Wire Line
	12750 7500 12750 7600
Wire Wire Line
	12650 7600 12750 7600
Connection ~ 12750 7600
Wire Wire Line
	12750 7600 12750 7700
Wire Wire Line
	12650 7700 12750 7700
Connection ~ 12750 7700
Wire Wire Line
	12750 7700 12750 7900
$Comp
L Device:R R13
U 1 1 5D809459
P 12950 6750
F 0 "R13" H 13020 6796 50  0000 L CNN
F 1 "R" H 13020 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 12880 6750 50  0001 C CNN
F 3 "~" H 12950 6750 50  0001 C CNN
	1    12950 6750
	1    0    0    -1  
$EndComp
Text Label 10900 7200 2    60   ~ 0
P5V_HAT
Wire Wire Line
	12950 7200 12950 6900
Wire Wire Line
	12650 7200 12950 7200
Wire Wire Line
	12950 6600 12950 6400
Text Label 12650 7200 0    50   ~ 0
HAT_PG
Wire Wire Line
	11350 7450 10900 7450
Text Label 10900 7450 0    50   ~ 0
HAT_PWR_EN
Wire Wire Line
	14200 2750 14950 2750
Wire Wire Line
	14200 3150 14950 3150
Wire Wire Line
	14200 3250 14950 3250
Wire Wire Line
	13700 3250 12950 3250
Wire Wire Line
	13700 3350 12950 3350
Wire Wire Line
	13700 3450 12950 3450
Wire Wire Line
	13700 3550 12950 3550
$Comp
L power:GND #PWR018
U 1 1 5D82D4F0
P 14300 4850
F 0 "#PWR018" H 14300 4600 50  0001 C CNN
F 1 "GND" H 14305 4677 50  0000 C CNN
F 2 "" H 14300 4850 50  0001 C CNN
F 3 "" H 14300 4850 50  0001 C CNN
	1    14300 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5D82DA60
P 13550 4850
F 0 "#PWR015" H 13550 4600 50  0001 C CNN
F 1 "GND" H 13555 4677 50  0000 C CNN
F 2 "" H 13550 4850 50  0001 C CNN
F 3 "" H 13550 4850 50  0001 C CNN
	1    13550 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	13700 2750 13600 2750
Wire Wire Line
	13700 2850 13600 2850
Wire Wire Line
	13600 2850 13600 2750
Connection ~ 13600 2750
Wire Wire Line
	13600 2750 13200 2750
Wire Wire Line
	13700 2950 13600 2950
Wire Wire Line
	13600 2950 13600 2850
Connection ~ 13600 2850
Wire Wire Line
	13700 3050 13600 3050
Wire Wire Line
	13600 3050 13600 2950
Connection ~ 13600 2950
Wire Wire Line
	13700 3150 13550 3150
Wire Wire Line
	13550 3150 13550 3650
Wire Wire Line
	13700 3650 13550 3650
Connection ~ 13550 3650
Wire Wire Line
	13550 3650 13550 3950
Wire Wire Line
	13700 3950 13550 3950
Connection ~ 13550 3950
Wire Wire Line
	13550 3950 13550 4150
Wire Wire Line
	13700 4150 13550 4150
Connection ~ 13550 4150
Wire Wire Line
	13550 4150 13550 4350
Wire Wire Line
	13700 4350 13550 4350
Connection ~ 13550 4350
Wire Wire Line
	13550 4350 13550 4550
Wire Wire Line
	13700 4550 13550 4550
Connection ~ 13550 4550
Wire Wire Line
	13550 4550 13550 4850
Wire Wire Line
	14200 4550 14300 4550
Wire Wire Line
	14300 4550 14300 4850
Wire Wire Line
	14200 4350 14300 4350
Wire Wire Line
	14300 4350 14300 4550
Connection ~ 14300 4550
Wire Wire Line
	14200 4150 14300 4150
Wire Wire Line
	14300 4150 14300 4350
Connection ~ 14300 4350
Wire Wire Line
	14200 3850 14300 3850
Wire Wire Line
	14300 3850 14300 4150
Connection ~ 14300 4150
Wire Wire Line
	14200 3050 14300 3050
Wire Wire Line
	14300 3050 14300 3350
Connection ~ 14300 3850
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J3
U 1 1 5D7ED1CF
P 13900 3650
F 0 "J3" H 13950 4767 50  0000 C CNN
F 1 "Conn_02x20_Counter_Clockwise" H 13950 4676 50  0000 C CNN
F 2 "Connector_Molex:Molex_SlimStack_501920-4001_2x20_P0.50mm_Vertical" H 13900 3650 50  0001 C CNN
F 3 "~" H 13900 3650 50  0001 C CNN
F 4 "WM9211CT-ND" H 13900 3650 50  0001 C CNN "Digikey"
F 5 "0538850408" H 13900 3650 50  0001 C CNN "Partnum"
	1    13900 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	14200 3350 14300 3350
Connection ~ 14300 3350
Wire Wire Line
	14300 3350 14300 3850
Text Label 12950 3250 0    50   ~ 0
GPIO1
Text Label 12950 3350 0    50   ~ 0
BL_ENABLE
Text Label 12950 3450 0    50   ~ 0
GPIO0
Text Label 12950 3550 0    50   ~ 0
WAKEUP
Text Label 14400 2750 0    50   ~ 0
RESET_N
Text Label 14400 3150 0    50   ~ 0
UART_RXD
Text Label 14400 3250 0    50   ~ 0
UART_TXD
Wire Wire Line
	3200 2550 4400 2550
Wire Wire Line
	3200 2650 4400 2650
Text Label 4400 2550 2    50   ~ 0
UART_RXD
Text Label 4400 2650 2    50   ~ 0
UART_TXD
Text Notes 4550 2650 0    50   ~ 0
The UART is from the perspective of the GRIM. \nUART_RXD is an input to the GRIM and UART_TXD is an output from the GRIM.
$Comp
L Connector:TestPoint TP1
U 1 1 5D8F9BCC
P 12950 3250
F 0 "TP1" V 13053 3322 50  0000 C CNN
F 1 "TestPoint" V 13054 3322 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 13150 3250 50  0001 C CNN
F 3 "~" H 13150 3250 50  0001 C CNN
	1    12950 3250
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5D8FA8B1
P 12950 3350
F 0 "TP2" V 13053 3422 50  0000 C CNN
F 1 "TestPoint" V 13054 3422 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 13150 3350 50  0001 C CNN
F 3 "~" H 13150 3350 50  0001 C CNN
	1    12950 3350
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5D8FAA7C
P 12950 3450
F 0 "TP3" V 13053 3522 50  0000 C CNN
F 1 "TestPoint" V 13054 3522 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 13150 3450 50  0001 C CNN
F 3 "~" H 13150 3450 50  0001 C CNN
	1    12950 3450
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5D8FAC1E
P 12950 3550
F 0 "TP4" V 13053 3622 50  0000 C CNN
F 1 "TestPoint" V 13054 3622 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 13150 3550 50  0001 C CNN
F 3 "~" H 13150 3550 50  0001 C CNN
	1    12950 3550
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 5D8FD1D9
P 14950 3250
F 0 "TP8" V 14950 3438 50  0000 L CNN
F 1 "TestPoint" V 15054 3322 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 15150 3250 50  0001 C CNN
F 3 "~" H 15150 3250 50  0001 C CNN
	1    14950 3250
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 5D8FD3BF
P 14950 3150
F 0 "TP7" V 14950 3338 50  0000 L CNN
F 1 "TestPoint" V 15054 3222 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 15150 3150 50  0001 C CNN
F 3 "~" H 15150 3150 50  0001 C CNN
	1    14950 3150
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 5D8FD7F9
P 14950 2750
F 0 "TP6" V 14950 2938 50  0000 L CNN
F 1 "TestPoint" V 15054 2822 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 15150 2750 50  0001 C CNN
F 3 "~" H 15150 2750 50  0001 C CNN
	1    14950 2750
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 5D8FDFD3
P 13800 7300
F 0 "TP5" V 13800 7488 50  0000 L CNN
F 1 "TestPoint" V 13904 7372 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 14000 7300 50  0001 C CNN
F 3 "~" H 14000 7300 50  0001 C CNN
	1    13800 7300
	0    1    1    0   
$EndComp
Connection ~ 13800 7300
$Comp
L Device:C C3
U 1 1 5D8FF3A2
P 13800 7700
F 0 "C3" H 13915 7746 50  0000 L CNN
F 1 "10u" H 13915 7655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 13838 7550 50  0001 C CNN
F 3 "~" H 13800 7700 50  0001 C CNN
F 4 "490-5523-1-ND" H 13800 7700 50  0001 C CNN "Digikey"
F 5 "GRM21BR61E106KA73L" H 13800 7700 50  0001 C CNN "Partnum"
	1    13800 7700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5D8FFA9F
P 14200 7700
F 0 "C4" H 14315 7746 50  0000 L CNN
F 1 "10u" H 14315 7655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14238 7550 50  0001 C CNN
F 3 "~" H 14200 7700 50  0001 C CNN
F 4 "490-5523-1-ND" H 14200 7700 50  0001 C CNN "Digikey"
F 5 "GRM21BR61E106KA73L" H 14200 7700 50  0001 C CNN "Partnum"
	1    14200 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	14200 7850 14200 8100
Wire Wire Line
	14200 8100 13800 8100
Connection ~ 13800 8100
Wire Wire Line
	13800 8100 13800 8400
Wire Wire Line
	14200 7550 14200 7450
Wire Wire Line
	14200 7450 13800 7450
Connection ~ 13800 7450
Wire Wire Line
	13800 7450 13800 7550
Wire Wire Line
	3200 4150 4400 4150
Wire Wire Line
	3200 4050 4400 4050
Wire Wire Line
	2000 3950 800  3950
Wire Wire Line
	3200 3350 4400 3350
Text Label 800  3950 0    50   ~ 0
MISO
Text Label 4400 4150 2    50   ~ 0
SCLK
Text Label 4400 4050 2    50   ~ 0
MOSI
Text Label 4400 3350 2    50   ~ 0
SS
Wire Wire Line
	2000 2750 800  2750
Wire Wire Line
	2000 2850 800  2850
Wire Wire Line
	2000 2950 800  2950
Wire Wire Line
	2000 3150 800  3150
Text Label 800  2750 0    50   ~ 0
BL_ENABLE
Text Label 800  2850 0    50   ~ 0
RESET_N
Text Label 800  2950 0    50   ~ 0
GPIO0
Text Label 800  3150 0    50   ~ 0
GPIO1
Wire Wire Line
	2000 3250 800  3250
Text Label 800  2550 0    50   ~ 0
HAT_PWR_EN
Wire Wire Line
	2000 3350 800  3350
Text Label 800  2450 0    50   ~ 0
HAT_PG
Wire Wire Line
	2000 3650 800  3650
Text Label 800  3650 0    50   ~ 0
WAKEUP
NoConn ~ 2000 3850
NoConn ~ 3200 3950
NoConn ~ 2000 4050
NoConn ~ 3200 3750
NoConn ~ 3200 3450
NoConn ~ 3200 3250
NoConn ~ 3200 3050
NoConn ~ 3200 2950
NoConn ~ 3200 2750
NoConn ~ 2000 3050
Wire Wire Line
	3200 2250 4400 2250
Wire Wire Line
	3200 2350 4400 2350
$Comp
L power:+3.3V #PWR016
U 1 1 5D81A9A6
P 13800 7300
F 0 "#PWR016" H 13800 7150 50  0001 C CNN
F 1 "+3.3V" H 13815 7473 50  0000 C CNN
F 2 "" H 13800 7300 50  0001 C CNN
F 3 "" H 13800 7300 50  0001 C CNN
	1    13800 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5D81E40C
P 2100 6350
F 0 "#PWR03" H 2100 6100 50  0001 C CNN
F 1 "GND" H 2105 6177 50  0000 C CNN
F 2 "" H 2100 6350 50  0001 C CNN
F 3 "" H 2100 6350 50  0001 C CNN
	1    2100 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5D82C318
P 1050 6150
F 0 "#PWR02" H 1050 5900 50  0001 C CNN
F 1 "GND" H 1055 5977 50  0000 C CNN
F 2 "" H 1050 6150 50  0001 C CNN
F 3 "" H 1050 6150 50  0001 C CNN
	1    1050 6150
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5D82CDF5
P 10550 7200
F 0 "#FLG01" H 10550 7275 50  0001 C CNN
F 1 "PWR_FLAG" V 10550 7327 50  0000 L CNN
F 2 "" H 10550 7200 50  0001 C CNN
F 3 "~" H 10550 7200 50  0001 C CNN
	1    10550 7200
	0    -1   -1   0   
$EndComp
Connection ~ 10550 7200
$Comp
L Mechanical:MountingHole H1
U 1 1 5D80B438
P 5600 9250
F 0 "H1" H 5450 9350 60  0000 C CNN
F 1 "3mm_Mounting_Hole" H 5600 9100 60  0000 C CNN
F 2 "MountingHole:MountingHole_2.1mm" H 5500 9250 60  0001 C CNN
F 3 "" H 5500 9250 60  0001 C CNN
	1    5600 9250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5D80B43E
P 6600 9250
F 0 "H5" H 6450 9350 60  0000 C CNN
F 1 "3mm_Mounting_Hole" H 6600 9100 60  0000 C CNN
F 2 "MountingHole:MountingHole_2.1mm" H 6500 9250 60  0001 C CNN
F 3 "" H 6500 9250 60  0001 C CNN
	1    6600 9250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5D80B444
P 5600 9800
F 0 "H2" H 5450 9900 60  0000 C CNN
F 1 "3mm_Mounting_Hole" H 5600 9650 60  0000 C CNN
F 2 "MountingHole:MountingHole_2.1mm" H 5500 9800 60  0001 C CNN
F 3 "" H 5500 9800 60  0001 C CNN
	1    5600 9800
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H7
U 1 1 5D80B44A
P 6650 9800
F 0 "H7" H 6500 9900 60  0000 C CNN
F 1 "3mm_Mounting_Hole" H 6650 9650 60  0000 C CNN
F 2 "MountingHole:MountingHole_2.1mm" H 6550 9800 60  0001 C CNN
F 3 "" H 6550 9800 60  0001 C CNN
	1    6650 9800
	1    0    0    -1  
$EndComp
$Comp
L RF_Module:DWM1000 DWM1
U 1 1 5D8452AA
P 9400 3500
F 0 "DWM1" H 8800 4550 50  0000 C CNN
F 1 "DWM1000" H 8850 4450 50  0000 C CNN
F 2 "RF_Module:DWM1000" H 10100 2500 50  0001 C CNN
F 3 "https://www.decawave.com/sites/default/files/resources/dwm1000-datasheet-v1.3.pdf" H 11800 2400 50  0001 C CNN
	1    9400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3400 7750 3400
Wire Wire Line
	8500 3500 7750 3500
NoConn ~ 14200 4050
NoConn ~ 14200 4250
NoConn ~ 14200 4450
NoConn ~ 14200 4650
Wire Wire Line
	10300 2800 10800 2800
Wire Wire Line
	10300 2900 10800 2900
Wire Wire Line
	10300 3000 10800 3000
Wire Wire Line
	10300 3100 10800 3100
$Comp
L power:GND #PWR05
U 1 1 5D890876
P 9400 4800
F 0 "#PWR05" H 9400 4550 50  0001 C CNN
F 1 "GND" H 9405 4627 50  0000 C CNN
F 2 "" H 9400 4800 50  0001 C CNN
F 3 "" H 9400 4800 50  0001 C CNN
	1    9400 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4600 9400 4700
Wire Wire Line
	9200 4600 9200 4700
Wire Wire Line
	9200 4700 9300 4700
Connection ~ 9400 4700
Wire Wire Line
	9400 4700 9400 4800
Wire Wire Line
	9300 4600 9300 4700
Connection ~ 9300 4700
Wire Wire Line
	9300 4700 9400 4700
Wire Wire Line
	9500 4600 9500 4700
Wire Wire Line
	9500 4700 9400 4700
Wire Wire Line
	9600 4600 9600 4700
Wire Wire Line
	9600 4700 9500 4700
Connection ~ 9500 4700
Wire Wire Line
	10300 2700 10800 2700
Text Label 10800 2700 2    50   ~ 0
UWB_IRQ
Text Label 10800 2800 2    50   ~ 0
SCLK
Text Label 10800 2900 2    50   ~ 0
MISO
Text Label 10800 3000 2    50   ~ 0
MOSI
Text Label 10800 3100 2    50   ~ 0
SS
Text Label 7750 3400 0    50   ~ 0
WAKEUP
Text Label 7750 3500 0    50   ~ 0
UWB_RSTn
Wire Wire Line
	2000 3750 800  3750
Text Label 800  2350 0    50   ~ 0
UWB_RSTn
$Comp
L Device:R R6
U 1 1 5D8C66C7
P 11000 4800
F 0 "R6" H 11070 4846 50  0000 L CNN
F 1 "DNP" H 11070 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10930 4800 50  0001 C CNN
F 3 "~" H 11000 4800 50  0001 C CNN
	1    11000 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5D8C7081
P 11000 5300
F 0 "R7" H 11070 5346 50  0000 L CNN
F 1 "0" H 11070 5255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10930 5300 50  0001 C CNN
F 3 "~" H 11000 5300 50  0001 C CNN
	1    11000 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5D8C73D7
P 11350 4800
F 0 "R9" H 11420 4846 50  0000 L CNN
F 1 "DNP" H 11420 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 11280 4800 50  0001 C CNN
F 3 "~" H 11350 4800 50  0001 C CNN
	1    11350 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5D8C7717
P 11350 5300
F 0 "R10" H 11420 5346 50  0000 L CNN
F 1 "0" H 11420 5255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 11280 5300 50  0001 C CNN
F 3 "~" H 11350 5300 50  0001 C CNN
	1    11350 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5D8C7A4F
P 11000 5700
F 0 "#PWR08" H 11000 5450 50  0001 C CNN
F 1 "GND" H 11005 5527 50  0000 C CNN
F 2 "" H 11000 5700 50  0001 C CNN
F 3 "" H 11000 5700 50  0001 C CNN
	1    11000 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5D8C80DA
P 11350 5700
F 0 "#PWR012" H 11350 5450 50  0001 C CNN
F 1 "GND" H 11355 5527 50  0000 C CNN
F 2 "" H 11350 5700 50  0001 C CNN
F 3 "" H 11350 5700 50  0001 C CNN
	1    11350 5700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR011
U 1 1 5D8C82BA
P 11350 4500
F 0 "#PWR011" H 11350 4350 50  0001 C CNN
F 1 "+3.3V" H 11365 4673 50  0000 C CNN
F 2 "" H 11350 4500 50  0001 C CNN
F 3 "" H 11350 4500 50  0001 C CNN
	1    11350 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR07
U 1 1 5D8C8FB0
P 11000 4500
F 0 "#PWR07" H 11000 4350 50  0001 C CNN
F 1 "+3.3V" H 11015 4673 50  0000 C CNN
F 2 "" H 11000 4500 50  0001 C CNN
F 3 "" H 11000 4500 50  0001 C CNN
	1    11000 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 4500 11000 4650
Wire Wire Line
	11350 4500 11350 4650
Wire Wire Line
	11350 5700 11350 5450
Wire Wire Line
	11000 5700 11000 5450
Wire Wire Line
	10300 4100 10500 4100
Wire Wire Line
	10500 5050 11000 5050
Wire Wire Line
	11000 5050 11000 4950
Wire Wire Line
	11000 5150 11000 5050
Connection ~ 11000 5050
Wire Wire Line
	11350 5150 11350 5050
Wire Wire Line
	11350 5050 11200 5050
Connection ~ 11350 5050
Wire Wire Line
	11350 5050 11350 4950
Wire Wire Line
	10500 4100 10500 5050
Wire Wire Line
	11200 4000 11200 5050
Wire Wire Line
	10300 4000 11200 4000
NoConn ~ 8500 3300
NoConn ~ 8500 3600
NoConn ~ 10300 3900
$Comp
L power:+3.3V #PWR04
U 1 1 5D944626
P 9400 2050
F 0 "#PWR04" H 9400 1900 50  0001 C CNN
F 1 "+3.3V" H 9415 2223 50  0000 C CNN
F 2 "" H 9400 2050 50  0001 C CNN
F 3 "" H 9400 2050 50  0001 C CNN
	1    9400 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2400 9300 2250
Wire Wire Line
	9300 2250 9400 2250
Wire Wire Line
	9500 2250 9500 2400
Wire Wire Line
	9400 2400 9400 2250
Connection ~ 9400 2250
Wire Wire Line
	9400 2250 9500 2250
Wire Wire Line
	9400 2050 9400 2250
$Comp
L Device:LED D1
U 1 1 5D96B9DB
P 11150 2850
F 0 "D1" V 11189 2733 50  0000 R CNN
F 1 "LED" V 11098 2733 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 11150 2850 50  0001 C CNN
F 3 "~" H 11150 2850 50  0001 C CNN
	1    11150 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R12
U 1 1 5D96CDF6
P 11700 3800
F 0 "R12" H 11770 3846 50  0000 L CNN
F 1 "1.5k" H 11770 3755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 11630 3800 50  0001 C CNN
F 3 "~" H 11700 3800 50  0001 C CNN
	1    11700 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5D9774AF
P 11400 3700
F 0 "R11" H 11470 3746 50  0000 L CNN
F 1 "1.5k" H 11470 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 11330 3700 50  0001 C CNN
F 3 "~" H 11400 3700 50  0001 C CNN
	1    11400 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5D9775FE
P 11100 3600
F 0 "R8" H 11170 3646 50  0000 L CNN
F 1 "1.5k" H 11170 3555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 11030 3600 50  0001 C CNN
F 3 "~" H 11100 3600 50  0001 C CNN
	1    11100 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5D977796
P 10800 3500
F 0 "R5" H 10870 3546 50  0000 L CNN
F 1 "1.5k" H 10870 3455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10730 3500 50  0001 C CNN
F 3 "~" H 10800 3500 50  0001 C CNN
	1    10800 3500
	0    1    1    0   
$EndComp
$Comp
L Device:LED D2
U 1 1 5D978774
P 11450 2850
F 0 "D2" V 11489 2733 50  0000 R CNN
F 1 "LED" V 11398 2733 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 11450 2850 50  0001 C CNN
F 3 "~" H 11450 2850 50  0001 C CNN
	1    11450 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D3
U 1 1 5D978A56
P 11750 2850
F 0 "D3" V 11789 2733 50  0000 R CNN
F 1 "LED" V 11698 2733 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 11750 2850 50  0001 C CNN
F 3 "~" H 11750 2850 50  0001 C CNN
	1    11750 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D4
U 1 1 5D978D83
P 12050 2850
F 0 "D4" V 12089 2733 50  0000 R CNN
F 1 "LED" V 11998 2733 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 12050 2850 50  0001 C CNN
F 3 "~" H 12050 2850 50  0001 C CNN
	1    12050 2850
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR010
U 1 1 5D979086
P 11150 2400
F 0 "#PWR010" H 11150 2250 50  0001 C CNN
F 1 "+3.3V" H 11165 2573 50  0000 C CNN
F 2 "" H 11150 2400 50  0001 C CNN
F 3 "" H 11150 2400 50  0001 C CNN
	1    11150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	11150 2400 11150 2500
Wire Wire Line
	11150 3000 11150 3500
Wire Wire Line
	11150 3500 10950 3500
Wire Wire Line
	10650 3500 10300 3500
Wire Wire Line
	10300 3600 10950 3600
Wire Wire Line
	11250 3600 11450 3600
Wire Wire Line
	11450 3600 11450 3000
Wire Wire Line
	11450 2500 11150 2500
Connection ~ 11150 2500
Wire Wire Line
	11150 2500 11150 2700
Wire Wire Line
	11450 2500 11450 2700
Wire Wire Line
	11450 2500 11750 2500
Wire Wire Line
	11750 2500 11750 2700
Connection ~ 11450 2500
Wire Wire Line
	11750 2500 12050 2500
Wire Wire Line
	12050 2500 12050 2700
Connection ~ 11750 2500
Wire Wire Line
	11750 3000 11750 3700
Wire Wire Line
	11750 3700 11550 3700
Wire Wire Line
	11250 3700 10300 3700
Wire Wire Line
	10300 3800 11550 3800
Wire Wire Line
	11850 3800 12050 3800
Wire Wire Line
	12050 3800 12050 3000
NoConn ~ 13700 3750
NoConn ~ 13700 3850
NoConn ~ 13700 4050
NoConn ~ 13700 4250
NoConn ~ 13700 4450
NoConn ~ 13700 4650
NoConn ~ 14200 3950
NoConn ~ 14200 3450
NoConn ~ 14200 3550
NoConn ~ 14200 3650
NoConn ~ 14200 3750
NoConn ~ 14200 2850
NoConn ~ 14200 2950
NoConn ~ 900  5050
Wire Wire Line
	2000 2250 800  2250
Text Label 800  2250 0    50   ~ 0
HAT_3V3
$Comp
L power:+3.3V #PWR0101
U 1 1 5DB056B1
P 12950 6400
F 0 "#PWR0101" H 12950 6250 50  0001 C CNN
F 1 "+3.3V" H 12965 6573 50  0000 C CNN
F 2 "" H 12950 6400 50  0001 C CNN
F 3 "" H 12950 6400 50  0001 C CNN
	1    12950 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0102
U 1 1 5DB05F4C
P 13200 2750
F 0 "#PWR0102" H 13200 2600 50  0001 C CNN
F 1 "+3.3V" H 13215 2923 50  0000 C CNN
F 2 "" H 13200 2750 50  0001 C CNN
F 3 "" H 13200 2750 50  0001 C CNN
	1    13200 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2350 800  2350
$Comp
L PiRF-rescue:OX40HAT-raspberrypi_hat J2
U 1 1 58DFC771
P 2600 2250
F 0 "J2" H 2950 2350 50  0000 C CNN
F 1 "40HAT" H 2300 2350 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 2600 2450 50  0001 C CNN
F 3 "" H 1900 2250 50  0000 C CNN
	1    2600 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2450 800  2450
Wire Wire Line
	2000 2550 800  2550
$EndSCHEMATC
