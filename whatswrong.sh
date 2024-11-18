#!/bin/bash

watch '
if [ -f /var/run/reboot-required ]; then
	cat /var/run/reboot-required
	cat /var/run/reboot-required.pkgs
	echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
fi
cat /proc/meminfo | grep "MemAvailable";
cat /proc/loadavg;
echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
cat /proc/cpuinfo | grep "cpu MHz";
echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
sensors | grep -E "Core|fan"
echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "energy:|energy-full:"
'
