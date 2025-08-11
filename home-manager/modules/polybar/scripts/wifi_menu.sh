#!/bin/bash

wifi_status=$(nmcli radio wifi)

if [[ "$wifi_status" == "disabled" ]]; then
  choice=$(echo -e "Enable Wi-Fi\nExit" | rofi -dmenu -p "Wi-Fi is Off")
  [[ "$choice" == "Enable Wi-Fi" ]] && nmcli radio wifi on
  exit
fi

networks=$(nmcli -t -f SSID dev wifi list | awk -F: '{print $1}')
options="Disable Wi-Fi\nExit\n$networks"

choice=$(echo -e "$options" | rofi -dmenu -p "Select Wi-Fi network")

if [[ "$choice" == "Disable Wi-Fi" ]]; then
  nmcli radio wifi off
elif [[ -n "$choice" && "$choice" != "Exit" ]]; then
  nmcli device wifi connect "$choice"
fi
