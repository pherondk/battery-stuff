#!/bin/bash

BATTLVL=$(ioreg -r -l -n AppleHSBluetoothDevice | egrep '"BatteryPercent" = |^  \|   "Bluetooth Product Name" = '| sed 's/  |   "Bluetooth Product Name" = "Magic Keyboard with Numeric Keypad"/ Keyboard:/'| sed 's/  |   "Bluetooth Product Name" = "Magic Trackpad 2"/ Trackpad:/'| sed 's/  |   |       "BatteryPercent" = / /'); #echo $BATTLVL

{ read a; read b; read c; read d; } <<< "${BATTLVL}"

		if [[ $a == *"Keyboard"* && $c == *"Trackpad"*  ]]; then
				BATTPERC=$(echo $a $b); echo $BATTPERC
		elif [[ $c == *"Keyboard"* ]]; then
		 		BATTPERC=$(echo $c $d); echo $BATTPERC;
		else [[ $a == *"Keyboard"* ]] && [[ $c == " " ]];# then
				# BATTPERC=$(echo $c $d); echo $BATTPERC
		#else
				echo "Keyboard: Charging"
		fi
