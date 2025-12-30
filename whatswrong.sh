#!/bin/bash

watch -n 10 '

if [ -f /var/run/reboot-required ]; then
  cat /var/run/reboot-required
  cat /var/run/reboot-required.pkgs
  echo "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
fi

uptime -p;
cut -d " " -f 1-3 /proc/loadavg;

echo "-+-+-+-+-+-+ memory available -+-+-+-+-+-+"
free -h | grep "Mem:" | cut -c 69-;

echo "-+-+-+-+-+-+ cpu MHz +-+-+-+-+-+-+-+-+-+-+"
cat /proc/cpuinfo | grep "cpu MHz" | cut -d ":" -f 2;

echo "-+-+-+-+-+-+ temperature +-+-+-+-+-+-+-+-+"
sensors | grep -E "Core|fan" | cut -d "(" -f 1;

echo "-+-+-+-+-+-+ battery +-+-+-+-+-+-+-+-+-+-+"
upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "energy:|energy-full:"
upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E "energy:|energy-full:"
'
