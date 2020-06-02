
#!/bin/bash

BATTLVL=$(ioreg -r -l -n AppleHSBluetoothDevice \
		| egrep '"BatteryPercent" = |^  \|   "Bluetooth Product Name" = '\
		| sed 's/  |   "Bluetooth Product Name" = "Magic Keyboard with Numeric Keypad"/Keyboard:/'\
		| sed 's/  |   "Bluetooth Product Name" = "Magic Trackpad 2"/Trackpad:/'\
		| sed 's/  |   |       "BatteryPercent" = / /'); #echo $BATTLVL

{ read a; read b; read c; read d; } <<< "${BATTLVL}"

if [[ $a == *"Trackpad"*  ]] && [[ $c == *"Keyboard"* ]]; then
		BATTPERC=$(echo $a $b); echo $BATTPERC;
elif [[ $a == *"Trackpad"* ]] && [[ -z $c ]]; then
		BATTPERC=$(echo $a $b); echo $BATTPERC;
elif [[ $a == *"Keyboard"* ]] && [[ $c == *"Trackpad"* ]]; then
		BATTPERC=$(echo $c $d); echo $BATTPERC;
else
		echo "Trackpad: Charging";
fi

