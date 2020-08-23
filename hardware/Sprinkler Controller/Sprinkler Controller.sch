EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5EA889F3
P 700 1200
F 0 "J1" H 618 875 50  0000 C CNN
F 1 "Conn_01x02" H 618 966 50  0000 C CNN
F 2 "Sprinkler Controller Parts:Terminal_2P_5mm" H 700 1200 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/phoenix-contact/1935161/277-1667-ND/568614" H 700 1200 50  0001 C CNN
	1    700  1200
	-1   0    0    -1  
$EndComp
$Comp
L Device:D_Bridge_+-AA D2
U 1 1 5EA8AE9B
P 1900 1250
F 0 "D2" H 2100 1400 50  0000 L CNN
F 1 "D_Bridge_+-AA" H 1600 800 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-269AA" H 1900 1250 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/comchip-technology/CDBHM2100L-HF/641-1432-1-ND/2731390" H 1900 1250 50  0001 C CNN
	1    1900 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5EA8BE04
P 2550 1350
F 0 "#PWR0101" H 2550 1100 50  0001 C CNN
F 1 "GND" H 2555 1177 50  0000 C CNN
F 2 "" H 2550 1350 50  0001 C CNN
F 3 "" H 2550 1350 50  0001 C CNN
	1    2550 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC #PWR0102
U 1 1 5EA8CA81
P 2550 950
F 0 "#PWR0102" H 2550 850 50  0001 C CNN
F 1 "+VDC" H 2550 1225 50  0000 C CNN
F 2 "" H 2550 950 50  0001 C CNN
F 3 "" H 2550 950 50  0001 C CNN
	1    2550 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1250 1600 1250
Wire Wire Line
	1350 900  1900 900 
Wire Wire Line
	1900 900  1900 950 
Wire Wire Line
	1900 1550 1900 1600
Wire Wire Line
	1900 1600 1350 1600
Text Notes 1050 750  0    50   ~ 0
24V from sprinkler transformer\nApprox. 34V DC
Wire Wire Line
	1550 1250 1550 1350
Wire Wire Line
	2200 1250 2300 1250
$Comp
L Device:C C2
U 1 1 5EA932C4
P 2550 1150
F 0 "C2" H 2665 1196 50  0000 L CNN
F 1 "220u" H 2600 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_Elec_10x10.2" H 2588 1000 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/EEE-FK1H221GP/PCE4324CT-ND/1014325" H 2550 1150 50  0001 C CNN
	1    2550 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 950  2550 950 
Wire Wire Line
	2550 950  2550 1000
Wire Wire Line
	2300 950  2300 1250
Connection ~ 2550 950 
Wire Wire Line
	2550 1350 2550 1300
Wire Wire Line
	1550 1350 2550 1350
Connection ~ 2550 1350
$Comp
L Regulator_Linear:LM317_3PinPackage U1
U 1 1 5EA98458
P 1850 3050
F 0 "U1" H 1850 3292 50  0000 C CNN
F 1 "LM317_3PinPackage" H 1850 3201 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-3_TabPin2" H 1850 3300 50  0001 C CIN
F 3 "https://www.digikey.com/product-detail/en/texas-instruments/LM317MKVURG3/296-19495-1-ND/1000285" H 1850 3050 50  0001 C CNN
	1    1850 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5EA99239
P 1150 3350
F 0 "C1" H 1265 3396 50  0000 L CNN
F 1 "0.1u" H 1265 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1188 3200 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/murata-electronics/GCM21BR72A104KA37K/490-8051-1-ND/4380336" H 1150 3350 50  0001 C CNN
	1    1150 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5EA99BE4
P 1850 3750
F 0 "R2" H 1909 3796 50  0000 L CNN
F 1 "14K" H 1909 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1850 3750 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB1402V/P14KDACT-ND/3074956" H 1850 3750 50  0001 C CNN
	1    1850 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5EA9A3DA
P 2300 3250
F 0 "R1" H 2359 3296 50  0000 L CNN
F 1 "4K7" H 2359 3205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2300 3250 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/RC0805FR-074K7L/311-4-70KCRCT-ND/730876" H 2300 3250 50  0001 C CNN
	1    2300 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Small D1
U 1 1 5EA9AAAB
P 1800 2650
F 0 "D1" H 1800 2855 50  0000 C CNN
F 1 "D_Small" H 1800 2764 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" V 1800 2650 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/diodes-incorporated/1N4148W-7-F/1N4148W-FDICT-ND/815280" V 1800 2650 50  0001 C CNN
	1    1800 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5EA9C09D
P 2700 3700
F 0 "C3" H 2815 3746 50  0000 L CNN
F 1 "1u" H 2815 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2738 3550 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/CC0805KKX7R6BB105/311-1458-1-ND/2833764" H 2700 3700 50  0001 C CNN
	1    2700 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5EA9C7C2
P 3400 3350
F 0 "C5" H 3515 3396 50  0000 L CNN
F 1 "1u" H 3515 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3438 3200 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/yageo/CC0805KKX7R6BB105/311-1458-1-ND/2833764" H 3400 3350 50  0001 C CNN
	1    3400 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3050 1350 3050
Wire Wire Line
	1150 3050 1150 3200
Wire Wire Line
	1150 3500 1150 3900
Wire Wire Line
	1150 3900 1850 3900
Wire Wire Line
	1850 3900 1850 3850
Wire Wire Line
	1850 3900 2250 3900
Wire Wire Line
	2700 3900 2700 3850
Connection ~ 1850 3900
Wire Wire Line
	3400 3900 3400 3500
Connection ~ 2700 3900
Wire Wire Line
	1850 3650 1850 3500
Wire Wire Line
	2700 3550 2700 3500
Wire Wire Line
	2700 3150 2700 3050
Wire Wire Line
	2700 3050 2500 3050
Wire Wire Line
	2300 3150 2300 3050
Connection ~ 2300 3050
Wire Wire Line
	2300 3050 2150 3050
Wire Wire Line
	1850 3500 2300 3500
Connection ~ 1850 3500
Wire Wire Line
	1850 3500 1850 3350
Connection ~ 2700 3500
Wire Wire Line
	2700 3500 2700 3350
Wire Wire Line
	2300 3350 2300 3500
Connection ~ 2300 3500
Wire Wire Line
	2300 3500 2700 3500
Wire Wire Line
	2700 3050 3400 3050
Wire Wire Line
	3400 3050 3400 3200
Connection ~ 2700 3050
Wire Wire Line
	2500 3050 2500 2650
Wire Wire Line
	2500 2650 1900 2650
Connection ~ 2500 3050
Wire Wire Line
	2500 3050 2300 3050
Wire Wire Line
	1700 2650 1350 2650
Wire Wire Line
	1350 2650 1350 3050
Connection ~ 1350 3050
Wire Wire Line
	1350 3050 1150 3050
$Comp
L power:+VDC #PWR0103
U 1 1 5EAA23B9
P 750 2850
F 0 "#PWR0103" H 750 2750 50  0001 C CNN
F 1 "+VDC" H 750 3125 50  0000 C CNN
F 2 "" H 750 2850 50  0001 C CNN
F 3 "" H 750 2850 50  0001 C CNN
	1    750  2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 3050 750  3050
Wire Wire Line
	750  3050 750  2850
Connection ~ 1150 3050
$Comp
L power:+5V #PWR0104
U 1 1 5EAA36A0
P 3700 2800
F 0 "#PWR0104" H 3700 2650 50  0001 C CNN
F 1 "+5V" H 3715 2973 50  0000 C CNN
F 2 "" H 3700 2800 50  0001 C CNN
F 3 "" H 3700 2800 50  0001 C CNN
	1    3700 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3050 3700 3050
Wire Wire Line
	3700 3050 3700 2800
Connection ~ 3400 3050
Text Notes 1350 2350 0    50   ~ 0
Linear 5V reg for powering the Pi
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J2
U 1 1 5EAA503F
P 6750 3100
F 0 "J2" H 6800 4217 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 6800 4126 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Vertical" H 6750 3100 50  0001 C CNN
F 3 "~" H 6750 3100 50  0001 C CNN
	1    6750 3100
	1    0    0    -1  
$EndComp
Text GLabel 1350 1000 2    50   Input ~ 0
VAC+
Text GLabel 1350 1500 2    50   Input ~ 0
VAC-
$Comp
L power:+5V #PWR0105
U 1 1 5EACC297
P 7400 2100
F 0 "#PWR0105" H 7400 1950 50  0001 C CNN
F 1 "+5V" H 7415 2273 50  0000 C CNN
F 2 "" H 7400 2100 50  0001 C CNN
F 3 "" H 7400 2100 50  0001 C CNN
	1    7400 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 2300 7400 2300
Wire Wire Line
	7400 2300 7400 2200
Wire Wire Line
	7050 2200 7400 2200
Connection ~ 7400 2200
Wire Wire Line
	7400 2200 7400 2100
Wire Wire Line
	7050 2400 7150 2400
Wire Wire Line
	7150 2400 7150 2800
Wire Wire Line
	7150 2800 7050 2800
Wire Wire Line
	6550 2600 6400 2600
Wire Wire Line
	6400 2600 6400 3400
Wire Wire Line
	6400 3400 6550 3400
Wire Wire Line
	7050 3100 7150 3100
Wire Wire Line
	7150 3100 7150 3600
Wire Wire Line
	7150 3600 7050 3600
Wire Wire Line
	7150 2800 7150 3100
Connection ~ 7150 2800
Connection ~ 7150 3100
Wire Wire Line
	7150 3600 7150 3800
Wire Wire Line
	7150 3800 7050 3800
Connection ~ 7150 3600
Wire Wire Line
	6550 4100 6400 4100
Wire Wire Line
	6400 4100 6400 3400
Connection ~ 6400 3400
Wire Wire Line
	7150 3800 7150 4300
Wire Wire Line
	7150 4300 6800 4300
Wire Wire Line
	6400 4300 6400 4100
Connection ~ 7150 3800
Connection ~ 6400 4100
Wire Wire Line
	6800 4300 6800 4400
Connection ~ 6800 4300
Wire Wire Line
	6800 4300 6400 4300
$Comp
L power:GND #PWR0106
U 1 1 5EADBFBC
P 6800 4400
F 0 "#PWR0106" H 6800 4150 50  0001 C CNN
F 1 "GND" H 6805 4227 50  0000 C CNN
F 2 "" H 6800 4400 50  0001 C CNN
F 3 "" H 6800 4400 50  0001 C CNN
	1    6800 4400
	1    0    0    -1  
$EndComp
NoConn ~ 6550 2200
NoConn ~ 6550 2300
NoConn ~ 6550 2400
NoConn ~ 6550 3000
NoConn ~ 6550 3500
NoConn ~ 7050 3500
NoConn ~ 7050 2600
NoConn ~ 7050 2500
$Comp
L Device:D_Small D3
U 1 1 5EA925C1
P 2700 3250
F 0 "D3" H 2700 3455 50  0000 C CNN
F 1 "D_Small" H 2700 3364 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" V 2700 3250 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/diodes-incorporated/1N4148W-7-F/1N4148W-FDICT-ND/815280" V 2700 3250 50  0001 C CNN
	1    2700 3250
	0    1    1    0   
$EndComp
Text Notes 6150 1200 0    50   ~ 0
40-pin pi socket\nhttps://www.digikey.com/product-detail/en/harwin-inc/M20-7832046/952-2150-ND/3728114\n\n40-pin male pins\nhttps://www.digikey.com/product-detail/en/w%C3%BCrth-elektronik/61304021121/732-5310-ND/4846886
NoConn ~ 6550 3800
NoConn ~ 6550 3900
NoConn ~ 6550 4000
NoConn ~ 7050 3900
NoConn ~ 7050 4000
NoConn ~ 7050 4100
Wire Wire Line
	6900 5200 6900 5300
Text GLabel 6750 5200 0    50   Input ~ 0
VAC+
Connection ~ 6900 5200
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 5ED17972
P 7100 5200
AR Path="/5ED17972" Ref="J4"  Part="1" 
AR Path="/5EB44427/5ED17972" Ref="J?"  Part="1" 
F 0 "J4" H 7200 5200 50  0000 C CNN
F 1 "Conn_01x02" H 7100 5350 50  0000 C CNN
F 2 "Sprinkler Controller Parts:Terminal_2P_5mm" H 7100 5200 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/phoenix-contact/1935161/277-1667-ND/568614" H 7100 5200 50  0001 C CNN
	1    7100 5200
	1    0    0    -1  
$EndComp
Text Notes 6900 4950 0    50   ~ 0
Common
Wire Wire Line
	6800 5200 6900 5200
Wire Wire Line
	6750 5200 6900 5200
$Sheet
S 4800 2450 550  200 
U 5EB44427
F0 "outputs_group1" 30
F1 "outputs.sch" 30
F2 "C_1" I R 5350 2500 50 
F3 "C_2" I R 5350 2600 50 
$EndSheet
$Sheet
S 4800 3600 550  200 
U 5ED84065
F0 "sheet5ED84065" 30
F1 "outputs.sch" 30
F2 "C_1" I R 5350 3650 50 
F3 "C_2" I R 5350 3750 50 
$EndSheet
$Sheet
S 4800 3200 550  200 
U 5ED84069
F0 "sheet5ED84069" 30
F1 "outputs.sch" 30
F2 "C_1" I R 5350 3250 50 
F3 "C_2" I R 5350 3350 50 
$EndSheet
$Sheet
S 8400 2850 550  200 
U 5ED885F7
F0 "sheet5ED885F7" 30
F1 "outputs.sch" 30
F2 "C_1" I L 8400 3000 50 
F3 "C_2" I L 8400 2900 50 
$EndSheet
$Sheet
S 8050 3250 550  200 
U 5ED885FB
F0 "sheet5ED885FB" 30
F1 "outputs.sch" 30
F2 "C_1" I L 8050 3400 50 
F3 "C_2" I L 8050 3300 50 
$EndSheet
$Sheet
S 8250 2350 550  200 
U 5ED885FF
F0 "sheet5ED885FF" 30
F1 "outputs.sch" 30
F2 "C_1" I L 8250 2500 50 
F3 "C_2" I L 8250 2400 50 
$EndSheet
$Sheet
S 4800 2850 550  200 
U 5ED80001
F0 "sheet5ED80001" 30
F1 "outputs.sch" 30
F2 "C_1" I R 5350 2900 50 
F3 "C_2" I R 5350 3000 50 
$EndSheet
$Sheet
S 8050 3600 550  200 
U 5ED885F3
F0 "sheet5ED885F3" 30
F1 "outputs.sch" 30
F2 "C_1" I L 8050 3750 50 
F3 "C_2" I L 8050 3650 50 
$EndSheet
Wire Wire Line
	6550 2700 5900 2700
Wire Wire Line
	5900 2700 5900 2500
Wire Wire Line
	5900 2500 5350 2500
Wire Wire Line
	5350 2600 6100 2600
Wire Wire Line
	6100 2600 6100 2500
Wire Wire Line
	6100 2500 6550 2500
Wire Wire Line
	5350 2900 6550 2900
Wire Wire Line
	5350 3000 5950 3000
Wire Wire Line
	5950 3000 5950 2800
Wire Wire Line
	5950 2800 6550 2800
Wire Wire Line
	5350 3350 6050 3350
Wire Wire Line
	6050 3350 6050 3100
Wire Wire Line
	6050 3100 6550 3100
Wire Wire Line
	6550 3200 5500 3200
Wire Wire Line
	5500 3200 5500 3250
Wire Wire Line
	5500 3250 5350 3250
Wire Wire Line
	7450 2700 7050 2700
Wire Wire Line
	7050 2900 7500 2900
Wire Wire Line
	8050 3400 7850 3400
Wire Wire Line
	5350 3750 6150 3750
Wire Wire Line
	6150 3750 6150 3300
Wire Wire Line
	6150 3300 6550 3300
Wire Wire Line
	5350 3650 6250 3650
Wire Wire Line
	6250 3650 6250 3600
Wire Wire Line
	6250 3600 6550 3600
$Comp
L power:GND #PWR0112
U 1 1 5EBE4D70
P 2250 3900
F 0 "#PWR0112" H 2250 3650 50  0001 C CNN
F 1 "GND" H 2255 3727 50  0000 C CNN
F 2 "" H 2250 3900 50  0001 C CNN
F 3 "" H 2250 3900 50  0001 C CNN
	1    2250 3900
	1    0    0    -1  
$EndComp
Connection ~ 2250 3900
Wire Wire Line
	2250 3900 2700 3900
Text Label 5450 2500 0    50   ~ 0
Channel_1
Text Label 5450 2600 0    50   ~ 0
Channel_2
Text Label 5450 2900 0    50   ~ 0
Channel_3
Text Label 5450 3000 0    50   ~ 0
Channel_4
Text Label 5550 3200 0    50   ~ 0
Channel_5
Text Label 5550 3350 0    50   ~ 0
Channel_6
Text Label 5550 3650 0    50   ~ 0
Channel_7
Text Label 5550 3750 0    50   ~ 0
Channel_8
Text Label 8000 2400 0    50   ~ 0
Channel_9
Text Label 7250 2700 0    50   ~ 0
Channel_10
Text Label 7800 3300 0    50   ~ 0
Channel_11
Text Label 7850 3400 0    50   ~ 0
Channel_12
Text Label 7900 2900 0    50   ~ 0
Channel_15
Text Label 7950 3000 0    50   ~ 0
Channel_16
Wire Wire Line
	7450 2500 8250 2500
Wire Wire Line
	7450 2500 7450 2700
Wire Wire Line
	7500 2400 7500 2900
Wire Wire Line
	7500 2400 8250 2400
Wire Wire Line
	7050 3000 8400 3000
Wire Wire Line
	7600 3200 7600 2900
Wire Wire Line
	7050 3200 7600 3200
Wire Wire Line
	7600 2900 8400 2900
Wire Wire Line
	7450 3300 7450 3400
Wire Wire Line
	7450 3300 8050 3300
Wire Wire Line
	7050 3400 7450 3400
Wire Wire Line
	7050 3300 7350 3300
Wire Wire Line
	7350 3300 7350 3350
Wire Wire Line
	7350 3350 7850 3350
Wire Wire Line
	7850 3350 7850 3400
Text Label 7500 3700 0    50   ~ 0
Channel_14
Text Label 7800 3650 0    50   ~ 0
Channel_13
Wire Wire Line
	8050 3650 7200 3650
Wire Wire Line
	7200 3650 7200 3700
Wire Wire Line
	7200 3700 7050 3700
Wire Wire Line
	6550 3700 6500 3700
Wire Wire Line
	6500 3700 6500 3750
Wire Wire Line
	6500 3750 8050 3750
$Comp
L Device:C C4
U 1 1 5F12AB32
P 1150 1250
F 0 "C4" H 1265 1296 50  0000 L CNN
F 1 "0.1u" H 1265 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1188 1100 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/murata-electronics/GCM21BR72A104KA37K/490-8051-1-ND/4380336" H 1150 1250 50  0001 C CNN
	1    1150 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  1200 950  1200
Wire Wire Line
	950  1200 950  1100
Wire Wire Line
	950  1100 1150 1100
Wire Wire Line
	1150 1100 1150 1050
Wire Wire Line
	1150 1050 1350 1050
Wire Wire Line
	1350 1050 1350 900 
Connection ~ 1150 1100
Wire Wire Line
	1350 1600 1350 1450
Wire Wire Line
	1350 1450 1150 1450
Wire Wire Line
	1150 1450 1150 1400
Wire Wire Line
	1150 1450 900  1450
Wire Wire Line
	900  1450 900  1300
Connection ~ 1150 1450
$Comp
L Device:LED_Small D?
U 1 1 5F1548A0
P 3700 3250
AR Path="/5EB44427/5F1548A0" Ref="D?"  Part="1" 
AR Path="/5F1548A0" Ref="D20"  Part="1" 
AR Path="/5EC830CE/5F1548A0" Ref="D?"  Part="1" 
AR Path="/5ED690FC/5F1548A0" Ref="D?"  Part="1" 
AR Path="/5ED80001/5F1548A0" Ref="D?"  Part="1" 
AR Path="/5ED84065/5F1548A0" Ref="D?"  Part="1" 
AR Path="/5ED84069/5F1548A0" Ref="D?"  Part="1" 
AR Path="/5ED885F3/5F1548A0" Ref="D?"  Part="1" 
AR Path="/5ED885F7/5F1548A0" Ref="D?"  Part="1" 
AR Path="/5ED885FB/5F1548A0" Ref="D?"  Part="1" 
AR Path="/5ED885FF/5F1548A0" Ref="D?"  Part="1" 
F 0 "D20" V 3746 3182 50  0000 R CNN
F 1 "LED_Small" V 3655 3182 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 3700 3250 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/broadcom-limited/HSMC-C170/516-1428-1-ND/637752" V 3700 3250 50  0001 C CNN
	1    3700 3250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F1548A6
P 3700 3450
AR Path="/5EB44427/5F1548A6" Ref="R?"  Part="1" 
AR Path="/5F1548A6" Ref="R51"  Part="1" 
AR Path="/5EC830CE/5F1548A6" Ref="R?"  Part="1" 
AR Path="/5ED690FC/5F1548A6" Ref="R?"  Part="1" 
AR Path="/5ED80001/5F1548A6" Ref="R?"  Part="1" 
AR Path="/5ED84065/5F1548A6" Ref="R?"  Part="1" 
AR Path="/5ED84069/5F1548A6" Ref="R?"  Part="1" 
AR Path="/5ED885F3/5F1548A6" Ref="R?"  Part="1" 
AR Path="/5ED885F7/5F1548A6" Ref="R?"  Part="1" 
AR Path="/5ED885FB/5F1548A6" Ref="R?"  Part="1" 
AR Path="/5ED885FF/5F1548A6" Ref="R?"  Part="1" 
F 0 "R51" H 3759 3496 50  0000 L CNN
F 1 "2K" H 3759 3405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3700 3450 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB202V/P2-0KDACT-ND/1465954" H 3700 3450 50  0001 C CNN
	1    3700 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3050 3700 3150
Connection ~ 3700 3050
Wire Wire Line
	2700 3900 3400 3900
Wire Wire Line
	3700 3550 3700 3900
Connection ~ 3400 3900
Wire Wire Line
	3400 3900 3700 3900
$EndSCHEMATC
