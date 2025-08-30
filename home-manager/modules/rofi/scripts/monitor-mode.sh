#!/bin/bash

choice=$(printf "Extend\nMirror" | rofi -dmenu -p "Display Mode")

if [ "$choice" = "Extend" ]; then
  xrandr --output eDP-1 --primary --mode 1920x1080 --rate 60 --output DP-1 --mode 1920x1080 --rate 60 --right-of eDP-1
elif [ "$choice" = "Mirror" ]; then
  xrandr --output DP-1 --mode 1920x1080 --same-as eDP-1
fi
