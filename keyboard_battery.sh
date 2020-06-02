#!/bin/bash

BATTLVL=$(ioreg -r -l -n AppleHSBluetoothDevice | egrep '"BatteryPercent" = |^  \|   "Bluetooth Product Name" = '| sed 's/  |   "Bluetooth Product Name" = "Magic Trackpad 2"/  \|  Trackpad:/' | sed 's/  |   "Bluetooth Product Name" = "Magic Keyboard with Numeric Keypad"/  \|  Keyboard:/'| sed 's/  |   |       "BatteryPercent" = / /'); #echo $BATTLVL

    BATTRPT=${BATTLVL//[$'\t\r\n']};  # Strips all instances of tab, newline, return.

	if [[ $BATTRPT == *"Keyboard"*  ]]; then
			 BATTPERC=$(echo $BATTRPT | awk '{ print "Keyboard: " $6"%" }'); echo $BATTPERC
	 else
			 echo "Keyboard: Charging"
	fi
