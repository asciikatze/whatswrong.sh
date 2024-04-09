#!/bin/bash

watch '
if [ -f /var/run/reboot-required ]; then
	cat /var/run/reboot-required
	cat /var/run/reboot-required.pkgs
	echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
fi
cat /proc/meminfo | grep "MemAvailable";
cat /proc/loadavg;
echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
cat /proc/cpuinfo | grep "cpu MHz";
echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
sensors | grep -E "Package id|Core|temp1|fan"
'
