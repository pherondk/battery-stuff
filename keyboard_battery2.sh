#!/bin/bash

# BATTLVL=$(ioreg -r -l -n AppleHSBluetoothDevice | egrep '"BatteryPercent" = |^  \|   "Bluetooth Product Name" = '| sed 's/  |   "Bluetooth Product Name" = "Magic Mouse 2"/  \|  Mouse:/' | sed 's/  |   "Bluetooth Product Name" = "Magic Keyboard with Numeric Keypad"/  \|  Keyboard:/'| sed 's/  |   |       "BatteryPercent" = / /'); #echo $BATTLVL 
BATTLVL=$(ioreg -r -l -n AppleHSBluetoothDevice | egrep '"BatteryPercent" = |^  \|   "Bluetooth Product Name" = '| sed 's/  |   "Bluetooth Product Name" = "Magic Trackpad 2"/  \|  Trackpad:/' | sed 's/  |   "Bluetooth Product Name" = "Magic Keyboard with Numeric Keypad"/  \|  Keyboard:/'| sed 's/  |   |       "BatteryPercent" = / /'); #echo $BATTLVL

    BATTRPT=${BATTLVL//[$'\t\r\n']};  # Strips all instances of tab, newline, return.

	BATTPERC=$(echo $BATTRPT | awk '{ print "Keyboard: " $6"%" }'); #echo $BATTPERC
	
    # BATTPERC=$(echo $BATTLVL | awk -F "=" '{ print "Trackpad: " $3, "%" }'); echo $BATTPERC
# theScript=$"display notification \"$BATTRPT\" "
#    echo $theScript | osascript
