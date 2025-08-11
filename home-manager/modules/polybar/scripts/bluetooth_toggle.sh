#!/bin/bash

state=$(bluetoothctl show | grep Powered | awk '{print $2}')

if [[ "$state" == "yes" ]]; then
  bluetoothctl power off
  notify-send "Bluetooth" "Bluetooth turned OFF"
else
  bluetoothctl power on
  notify-send "Bluetooth" "Bluetooth turned ON"
fi
