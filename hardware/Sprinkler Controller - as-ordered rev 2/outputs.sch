EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	3800 3450 3750 3450
$Comp
L Sprinkler~Controller~Parts:G3VM-62F1 U2
U 1 1 5EB47F4F
P 4350 3300
AR Path="/5EB44427/5EB47F4F" Ref="U2"  Part="1" 
AR Path="/5ED690FC/5EB47F4F" Ref="U?"  Part="1" 
AR Path="/5ED80001/5EB47F4F" Ref="U3"  Part="1" 
AR Path="/5ED84065/5EB47F4F" Ref="U4"  Part="1" 
AR Path="/5ED84069/5EB47F4F" Ref="U5"  Part="1" 
AR Path="/5ED885F3/5EB47F4F" Ref="U6"  Part="1" 
AR Path="/5ED885F7/5EB47F4F" Ref="U7"  Part="1" 
AR Path="/5ED885FB/5EB47F4F" Ref="U8"  Part="1" 
AR Path="/5ED885FF/5EB47F4F" Ref="U9"  Part="1" 
F 0 "U2" H 4375 2982 30  0000 C CNN
F 1 "G3VM-62F1" H 4375 3042 30  0000 C CNN
F 2 "Package_DIP:DIP-8_W8.89mm_SMDSocket_LongPads" H 4150 3250 30  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/omron-electronics-inc-emc-div/G3VM-62F1/Z2108-ND/673298" H 4150 3250 30  0001 C CNN
	1    4350 3300
	-1   0    0    1   
$EndComp
Text GLabel 3900 2950 2    50   Input ~ 0
VAC-
Wire Wire Line
	3800 3150 3750 3150
Wire Wire Line
	3750 3150 3750 2950
Wire Wire Line
	3750 2950 3900 2950
$Comp
L Device:R_Small R3
U 1 1 5EB5B7BA
P 5100 3250
AR Path="/5EB44427/5EB5B7BA" Ref="R3"  Part="1" 
AR Path="/5ED690FC/5EB5B7BA" Ref="R?"  Part="1" 
AR Path="/5ED80001/5EB5B7BA" Ref="R7"  Part="1" 
AR Path="/5ED84065/5EB5B7BA" Ref="R11"  Part="1" 
AR Path="/5ED84069/5EB5B7BA" Ref="R15"  Part="1" 
AR Path="/5ED885F3/5EB5B7BA" Ref="R19"  Part="1" 
AR Path="/5ED885F7/5EB5B7BA" Ref="R23"  Part="1" 
AR Path="/5ED885FB/5EB5B7BA" Ref="R27"  Part="1" 
AR Path="/5ED885FF/5EB5B7BA" Ref="R31"  Part="1" 
F 0 "R3" V 5296 3250 50  0000 C CNN
F 1 "680R" V 5205 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5100 3250 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/bourns-inc/CR0805-JW-681ELF/CR0805-JW-681ELFCT-ND/4247988" H 5100 3250 50  0001 C CNN
	1    5100 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4850 3450 5000 3450
Wire Wire Line
	4850 3250 5000 3250
Wire Wire Line
	5200 3250 5450 3250
Wire Wire Line
	5200 3450 5450 3450
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5EA941F7
P 2800 3350
AR Path="/5EA941F7" Ref="J?"  Part="1" 
AR Path="/5EB44427/5EA941F7" Ref="J3"  Part="1" 
AR Path="/5ED690FC/5EA941F7" Ref="J?"  Part="1" 
AR Path="/5ED80001/5EA941F7" Ref="J5"  Part="1" 
AR Path="/5ED84065/5EA941F7" Ref="J6"  Part="1" 
AR Path="/5ED84069/5EA941F7" Ref="J7"  Part="1" 
AR Path="/5ED885F3/5EA941F7" Ref="J8"  Part="1" 
AR Path="/5ED885F7/5EA941F7" Ref="J9"  Part="1" 
AR Path="/5ED885FB/5EA941F7" Ref="J10"  Part="1" 
AR Path="/5ED885FF/5EA941F7" Ref="J11"  Part="1" 
F 0 "J3" H 2900 3250 50  0000 C CNN
F 1 "Conn_01x02" H 2800 3100 50  0000 C CNN
F 2 "Sprinkler Controller Parts:Terminal_2P_5mm" H 2800 3350 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/phoenix-contact/1935161/277-1667-ND/568614" H 2800 3350 50  0001 C CNN
	1    2800 3350
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5EA96547
P 5100 3450
AR Path="/5EB44427/5EA96547" Ref="R4"  Part="1" 
AR Path="/5ED690FC/5EA96547" Ref="R?"  Part="1" 
AR Path="/5ED80001/5EA96547" Ref="R8"  Part="1" 
AR Path="/5ED84065/5EA96547" Ref="R12"  Part="1" 
AR Path="/5ED84069/5EA96547" Ref="R16"  Part="1" 
AR Path="/5ED885F3/5EA96547" Ref="R20"  Part="1" 
AR Path="/5ED885F7/5EA96547" Ref="R24"  Part="1" 
AR Path="/5ED885FB/5EA96547" Ref="R28"  Part="1" 
AR Path="/5ED885FF/5EA96547" Ref="R32"  Part="1" 
F 0 "R4" V 4900 3450 50  0000 C CNN
F 1 "680R" V 5000 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5100 3450 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/bourns-inc/CR0805-JW-681ELF/CR0805-JW-681ELFCT-ND/4247988" H 5100 3450 50  0001 C CNN
	1    5100 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D7
U 1 1 5EAD0F4D
P 6750 2700
AR Path="/5EB44427/5EAD0F4D" Ref="D7"  Part="1" 
AR Path="/5EAD0F4D" Ref="D?"  Part="1" 
AR Path="/5EC830CE/5EAD0F4D" Ref="D?"  Part="1" 
AR Path="/5ED690FC/5EAD0F4D" Ref="D?"  Part="1" 
AR Path="/5ED80001/5EAD0F4D" Ref="D11"  Part="1" 
AR Path="/5ED84065/5EAD0F4D" Ref="D15"  Part="1" 
AR Path="/5ED84069/5EAD0F4D" Ref="D19"  Part="1" 
AR Path="/5ED885F3/5EAD0F4D" Ref="D23"  Part="1" 
AR Path="/5ED885F7/5EAD0F4D" Ref="D27"  Part="1" 
AR Path="/5ED885FB/5EAD0F4D" Ref="D31"  Part="1" 
AR Path="/5ED885FF/5EAD0F4D" Ref="D35"  Part="1" 
F 0 "D7" V 6796 2632 50  0000 R CNN
F 1 "LED_Small" V 6705 2632 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 6750 2700 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/broadcom-limited/HSMC-C170/516-1428-1-ND/637752" V 6750 2700 50  0001 C CNN
	1    6750 2700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R6
U 1 1 5EAD0F59
P 6750 2900
AR Path="/5EB44427/5EAD0F59" Ref="R6"  Part="1" 
AR Path="/5EAD0F59" Ref="R?"  Part="1" 
AR Path="/5EC830CE/5EAD0F59" Ref="R?"  Part="1" 
AR Path="/5ED690FC/5EAD0F59" Ref="R?"  Part="1" 
AR Path="/5ED80001/5EAD0F59" Ref="R10"  Part="1" 
AR Path="/5ED84065/5EAD0F59" Ref="R14"  Part="1" 
AR Path="/5ED84069/5EAD0F59" Ref="R18"  Part="1" 
AR Path="/5ED885F3/5EAD0F59" Ref="R22"  Part="1" 
AR Path="/5ED885F7/5EAD0F59" Ref="R26"  Part="1" 
AR Path="/5ED885FB/5EAD0F59" Ref="R30"  Part="1" 
AR Path="/5ED885FF/5EAD0F59" Ref="R34"  Part="1" 
F 0 "R6" H 6809 2946 50  0000 L CNN
F 1 "2K" H 6809 2855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6750 2900 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB202V/P2-0KDACT-ND/1465954" H 6750 2900 50  0001 C CNN
	1    6750 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EAD0F5F
P 6750 4000
AR Path="/5EC830CE/5EAD0F5F" Ref="#PWR?"  Part="1" 
AR Path="/5EB44427/5EAD0F5F" Ref="#PWR0107"  Part="1" 
AR Path="/5ED690FC/5EAD0F5F" Ref="#PWR?"  Part="1" 
AR Path="/5ED80001/5EAD0F5F" Ref="#PWR0347"  Part="1" 
AR Path="/5ED84065/5EAD0F5F" Ref="#PWR0147"  Part="1" 
AR Path="/5ED84069/5EAD0F5F" Ref="#PWR0187"  Part="1" 
AR Path="/5ED885F3/5EAD0F5F" Ref="#PWR0387"  Part="1" 
AR Path="/5ED885F7/5EAD0F5F" Ref="#PWR0227"  Part="1" 
AR Path="/5ED885FB/5EAD0F5F" Ref="#PWR0267"  Part="1" 
AR Path="/5ED885FF/5EAD0F5F" Ref="#PWR0307"  Part="1" 
F 0 "#PWR0387" H 6750 3750 50  0001 C CNN
F 1 "GND" H 6755 3827 50  0000 C CNN
F 2 "" H 6750 4000 50  0001 C CNN
F 3 "" H 6750 4000 50  0001 C CNN
	1    6750 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3200 6750 3150
$Comp
L Device:LED_Small D6
U 1 1 5EB778F6
P 5650 2700
AR Path="/5EB44427/5EB778F6" Ref="D6"  Part="1" 
AR Path="/5EB778F6" Ref="D?"  Part="1" 
AR Path="/5EC830CE/5EB778F6" Ref="D?"  Part="1" 
AR Path="/5ED690FC/5EB778F6" Ref="D?"  Part="1" 
AR Path="/5ED80001/5EB778F6" Ref="D10"  Part="1" 
AR Path="/5ED84065/5EB778F6" Ref="D14"  Part="1" 
AR Path="/5ED84069/5EB778F6" Ref="D18"  Part="1" 
AR Path="/5ED885F3/5EB778F6" Ref="D22"  Part="1" 
AR Path="/5ED885F7/5EB778F6" Ref="D26"  Part="1" 
AR Path="/5ED885FB/5EB778F6" Ref="D30"  Part="1" 
AR Path="/5ED885FF/5EB778F6" Ref="D34"  Part="1" 
F 0 "D6" V 5696 2632 50  0000 R CNN
F 1 "LED_Small" V 5605 2632 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 5650 2700 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/broadcom-limited/HSMC-C170/516-1428-1-ND/637752" V 5650 2700 50  0001 C CNN
	1    5650 2700
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 5EB778FC
P 5650 2600
AR Path="/5EB44427/5EB778FC" Ref="#PWR0108"  Part="1" 
AR Path="/5EB778FC" Ref="#PWR?"  Part="1" 
AR Path="/5EC830CE/5EB778FC" Ref="#PWR?"  Part="1" 
AR Path="/5ED690FC/5EB778FC" Ref="#PWR?"  Part="1" 
AR Path="/5ED80001/5EB778FC" Ref="#PWR0348"  Part="1" 
AR Path="/5ED84065/5EB778FC" Ref="#PWR0148"  Part="1" 
AR Path="/5ED84069/5EB778FC" Ref="#PWR0188"  Part="1" 
AR Path="/5ED885F3/5EB778FC" Ref="#PWR0388"  Part="1" 
AR Path="/5ED885F7/5EB778FC" Ref="#PWR0228"  Part="1" 
AR Path="/5ED885FB/5EB778FC" Ref="#PWR0268"  Part="1" 
AR Path="/5ED885FF/5EB778FC" Ref="#PWR0308"  Part="1" 
F 0 "#PWR0388" H 5650 2450 50  0001 C CNN
F 1 "+5V" H 5665 2773 50  0000 C CNN
F 2 "" H 5650 2600 50  0001 C CNN
F 3 "" H 5650 2600 50  0001 C CNN
	1    5650 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5EB77902
P 5650 2900
AR Path="/5EB44427/5EB77902" Ref="R5"  Part="1" 
AR Path="/5EB77902" Ref="R?"  Part="1" 
AR Path="/5EC830CE/5EB77902" Ref="R?"  Part="1" 
AR Path="/5ED690FC/5EB77902" Ref="R?"  Part="1" 
AR Path="/5ED80001/5EB77902" Ref="R9"  Part="1" 
AR Path="/5ED84065/5EB77902" Ref="R13"  Part="1" 
AR Path="/5ED84069/5EB77902" Ref="R17"  Part="1" 
AR Path="/5ED885F3/5EB77902" Ref="R21"  Part="1" 
AR Path="/5ED885F7/5EB77902" Ref="R25"  Part="1" 
AR Path="/5ED885FB/5EB77902" Ref="R29"  Part="1" 
AR Path="/5ED885FF/5EB77902" Ref="R33"  Part="1" 
F 0 "R5" H 5709 2946 50  0000 L CNN
F 1 "2K" H 5709 2855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5650 2900 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB202V/P2-0KDACT-ND/1465954" H 5650 2900 50  0001 C CNN
	1    5650 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB77908
P 5650 4100
AR Path="/5EC830CE/5EB77908" Ref="#PWR?"  Part="1" 
AR Path="/5EB44427/5EB77908" Ref="#PWR0109"  Part="1" 
AR Path="/5ED690FC/5EB77908" Ref="#PWR?"  Part="1" 
AR Path="/5ED80001/5EB77908" Ref="#PWR0349"  Part="1" 
AR Path="/5ED84065/5EB77908" Ref="#PWR0149"  Part="1" 
AR Path="/5ED84069/5EB77908" Ref="#PWR0189"  Part="1" 
AR Path="/5ED885F3/5EB77908" Ref="#PWR0389"  Part="1" 
AR Path="/5ED885F7/5EB77908" Ref="#PWR0229"  Part="1" 
AR Path="/5ED885FB/5EB77908" Ref="#PWR0269"  Part="1" 
AR Path="/5ED885FF/5EB77908" Ref="#PWR0309"  Part="1" 
F 0 "#PWR0389" H 5650 3850 50  0001 C CNN
F 1 "GND" H 5655 3927 50  0000 C CNN
F 2 "" H 5650 4100 50  0001 C CNN
F 3 "" H 5650 4100 50  0001 C CNN
	1    5650 4100
	1    0    0    -1  
$EndComp
Text HLabel 6150 3600 2    49   Input ~ 0
C_1
Wire Wire Line
	5650 3400 5650 3350
Wire Wire Line
	4850 3350 5650 3350
Connection ~ 5650 3350
Wire Wire Line
	5650 3350 5650 3000
Wire Wire Line
	4850 3150 6750 3150
Connection ~ 6750 3150
Wire Wire Line
	6750 3150 6750 3000
$Comp
L power:+5V #PWR0110
U 1 1 5EBCD33B
P 5450 2950
AR Path="/5EB44427/5EBCD33B" Ref="#PWR0110"  Part="1" 
AR Path="/5EBCD33B" Ref="#PWR?"  Part="1" 
AR Path="/5EC830CE/5EBCD33B" Ref="#PWR?"  Part="1" 
AR Path="/5ED690FC/5EBCD33B" Ref="#PWR?"  Part="1" 
AR Path="/5ED80001/5EBCD33B" Ref="#PWR0350"  Part="1" 
AR Path="/5ED84065/5EBCD33B" Ref="#PWR0150"  Part="1" 
AR Path="/5ED84069/5EBCD33B" Ref="#PWR0190"  Part="1" 
AR Path="/5ED885F3/5EBCD33B" Ref="#PWR0390"  Part="1" 
AR Path="/5ED885F7/5EBCD33B" Ref="#PWR0230"  Part="1" 
AR Path="/5ED885FB/5EBCD33B" Ref="#PWR0270"  Part="1" 
AR Path="/5ED885FF/5EBCD33B" Ref="#PWR0310"  Part="1" 
F 0 "#PWR0390" H 5450 2800 50  0001 C CNN
F 1 "+5V" H 5465 3123 50  0000 C CNN
F 2 "" H 5450 2950 50  0001 C CNN
F 3 "" H 5450 2950 50  0001 C CNN
	1    5450 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3450 5450 3250
Wire Wire Line
	5450 3250 5450 2950
Connection ~ 5450 3250
$Comp
L power:+5V #PWR0111
U 1 1 5EAD0F53
P 6750 2600
AR Path="/5EB44427/5EAD0F53" Ref="#PWR0111"  Part="1" 
AR Path="/5EAD0F53" Ref="#PWR?"  Part="1" 
AR Path="/5EC830CE/5EAD0F53" Ref="#PWR?"  Part="1" 
AR Path="/5ED690FC/5EAD0F53" Ref="#PWR?"  Part="1" 
AR Path="/5ED80001/5EAD0F53" Ref="#PWR0351"  Part="1" 
AR Path="/5ED84065/5EAD0F53" Ref="#PWR0151"  Part="1" 
AR Path="/5ED84069/5EAD0F53" Ref="#PWR0191"  Part="1" 
AR Path="/5ED885F3/5EAD0F53" Ref="#PWR0391"  Part="1" 
AR Path="/5ED885F7/5EAD0F53" Ref="#PWR0231"  Part="1" 
AR Path="/5ED885FB/5EAD0F53" Ref="#PWR0271"  Part="1" 
AR Path="/5ED885FF/5EAD0F53" Ref="#PWR0311"  Part="1" 
F 0 "#PWR0391" H 6750 2450 50  0001 C CNN
F 1 "+5V" H 6765 2773 50  0000 C CNN
F 2 "" H 6750 2600 50  0001 C CNN
F 3 "" H 6750 2600 50  0001 C CNN
	1    6750 2600
	1    0    0    -1  
$EndComp
Text HLabel 7250 3400 2    49   Input ~ 0
C_2
$Comp
L Sprinkler~Controller~Parts:PESD1CAN-U D4
U 1 1 5EC1C591
P 3350 3750
AR Path="/5EB44427/5EC1C591" Ref="D4"  Part="1" 
AR Path="/5ED84065/5EC1C591" Ref="D5"  Part="1" 
AR Path="/5ED84069/5EC1C591" Ref="D8"  Part="1" 
AR Path="/5ED885F7/5EC1C591" Ref="D9"  Part="1" 
AR Path="/5ED885FB/5EC1C591" Ref="D12"  Part="1" 
AR Path="/5ED885FF/5EC1C591" Ref="D13"  Part="1" 
AR Path="/5ED80001/5EC1C591" Ref="D16"  Part="1" 
AR Path="/5ED885F3/5EC1C591" Ref="D17"  Part="1" 
F 0 "D4" H 3350 4075 50  0000 C CNN
F 1 "PESD1CAN-U" H 3350 3984 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-323_SC-70" H 3250 3750 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/nexperia-usa-inc/PESD1CAN-UX/1727-1306-1-ND/4386316" H 3250 3750 50  0001 C CNN
	1    3350 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3350 3050 3350
Wire Wire Line
	3000 3250 3100 3250
Wire Wire Line
	3750 3450 3750 3150
Connection ~ 3750 3150
Wire Wire Line
	3750 3450 3750 3750
Wire Wire Line
	3750 3750 3600 3750
Connection ~ 3750 3450
Wire Wire Line
	3100 3650 3100 3250
Connection ~ 3100 3250
Wire Wire Line
	3100 3250 3800 3250
Wire Wire Line
	3100 3850 3050 3850
Wire Wire Line
	3050 3850 3050 3350
Connection ~ 3050 3350
Wire Wire Line
	3050 3350 3800 3350
$Comp
L Device:Q_NMOS_GSD Q5
U 1 1 5EC2BF29
P 5750 3600
AR Path="/5ED84069/5EC2BF29" Ref="Q5"  Part="1" 
AR Path="/5EB44427/5EC2BF29" Ref="Q1"  Part="1" 
AR Path="/5ED84065/5EC2BF29" Ref="Q3"  Part="1" 
AR Path="/5ED885F7/5EC2BF29" Ref="Q7"  Part="1" 
AR Path="/5ED885FB/5EC2BF29" Ref="Q9"  Part="1" 
AR Path="/5ED885FF/5EC2BF29" Ref="Q11"  Part="1" 
AR Path="/5ED80001/5EC2BF29" Ref="Q13"  Part="1" 
AR Path="/5ED885F3/5EC2BF29" Ref="Q15"  Part="1" 
F 0 "Q1" H 5955 3646 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 5955 3555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5950 3700 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/infineon-technologies/BSS806NEH6327XTSA1/BSS806NEH6327XTSA1CT-ND/6564444" H 5750 3600 50  0001 C CNN
	1    5750 3600
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q6
U 1 1 5EC2D522
P 6850 3400
AR Path="/5ED84069/5EC2D522" Ref="Q6"  Part="1" 
AR Path="/5EB44427/5EC2D522" Ref="Q2"  Part="1" 
AR Path="/5ED84065/5EC2D522" Ref="Q4"  Part="1" 
AR Path="/5ED885F7/5EC2D522" Ref="Q8"  Part="1" 
AR Path="/5ED885FB/5EC2D522" Ref="Q10"  Part="1" 
AR Path="/5ED885FF/5EC2D522" Ref="Q12"  Part="1" 
AR Path="/5ED80001/5EC2D522" Ref="Q14"  Part="1" 
AR Path="/5ED885F3/5EC2D522" Ref="Q16"  Part="1" 
F 0 "Q2" H 7055 3446 50  0000 L CNN
F 1 "Q_NMOS_GSD" H 7055 3355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7050 3500 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/infineon-technologies/BSS806NEH6327XTSA1/BSS806NEH6327XTSA1CT-ND/6564444" H 6850 3400 50  0001 C CNN
	1    6850 3400
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R35
U 1 1 5EC62567
P 6050 3850
AR Path="/5EB44427/5EC62567" Ref="R35"  Part="1" 
AR Path="/5EC62567" Ref="R?"  Part="1" 
AR Path="/5EC830CE/5EC62567" Ref="R?"  Part="1" 
AR Path="/5ED690FC/5EC62567" Ref="R?"  Part="1" 
AR Path="/5ED80001/5EC62567" Ref="R47"  Part="1" 
AR Path="/5ED84065/5EC62567" Ref="R37"  Part="1" 
AR Path="/5ED84069/5EC62567" Ref="R39"  Part="1" 
AR Path="/5ED885F3/5EC62567" Ref="R49"  Part="1" 
AR Path="/5ED885F7/5EC62567" Ref="R41"  Part="1" 
AR Path="/5ED885FB/5EC62567" Ref="R43"  Part="1" 
AR Path="/5ED885FF/5EC62567" Ref="R45"  Part="1" 
F 0 "R35" H 6109 3896 50  0000 L CNN
F 1 "10K" H 6109 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6050 3850 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB103V/P10KDACT-ND/1465971" H 6050 3850 50  0001 C CNN
	1    6050 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R36
U 1 1 5EC62B7F
P 7150 3750
AR Path="/5EB44427/5EC62B7F" Ref="R36"  Part="1" 
AR Path="/5EC62B7F" Ref="R?"  Part="1" 
AR Path="/5EC830CE/5EC62B7F" Ref="R?"  Part="1" 
AR Path="/5ED690FC/5EC62B7F" Ref="R?"  Part="1" 
AR Path="/5ED80001/5EC62B7F" Ref="R48"  Part="1" 
AR Path="/5ED84065/5EC62B7F" Ref="R38"  Part="1" 
AR Path="/5ED84069/5EC62B7F" Ref="R40"  Part="1" 
AR Path="/5ED885F3/5EC62B7F" Ref="R50"  Part="1" 
AR Path="/5ED885F7/5EC62B7F" Ref="R42"  Part="1" 
AR Path="/5ED885FB/5EC62B7F" Ref="R44"  Part="1" 
AR Path="/5ED885FF/5EC62B7F" Ref="R46"  Part="1" 
F 0 "R36" H 7209 3796 50  0000 L CNN
F 1 "10K" H 7209 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 7150 3750 50  0001 C CNN
F 3 "https://www.digikey.com/product-detail/en/panasonic-electronic-components/ERA-6AEB103V/P10KDACT-ND/1465971" H 7150 3750 50  0001 C CNN
	1    7150 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3600 6050 3600
Wire Wire Line
	6050 3600 6050 3750
Wire Wire Line
	5950 3600 6050 3600
Connection ~ 6050 3600
Wire Wire Line
	5650 3800 5650 4000
Wire Wire Line
	6050 3950 6050 4000
Wire Wire Line
	6050 4000 5650 4000
Connection ~ 5650 4000
Wire Wire Line
	5650 4000 5650 4100
Wire Wire Line
	7050 3400 7150 3400
Wire Wire Line
	7150 3400 7150 3650
Connection ~ 7150 3400
Wire Wire Line
	7150 3400 7250 3400
Wire Wire Line
	7150 3850 6750 3850
Wire Wire Line
	6750 3850 6750 4000
Wire Wire Line
	6750 3600 6750 3850
Connection ~ 6750 3850
$EndSCHEMATC
