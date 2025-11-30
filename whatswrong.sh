#!/bin/bash

# This is a simple diagnostic bash script.
# The whole thing wrapped up in the watch command so the values keep refreshing, with the -n you can modify how often this happen in seconds.
# The echo -+-+... writes out a neat separator line between the values, it can be anything just to help you see the results better.
# First its looking at the /var/run/reboot-required and /var/run/reboot-required.pkgs files if present than shows those files content. This works on Ubuntu I haven't tested on other distributions.
# Next we writing out the amount of avaiable memory line from the file /proc/meminfo and values from uptime especially the load average to see if the processes overwhelm the cpu.
# Than we see the current clock speed of the cpu threads.
# The sensors line to work you need to install lm-sensors. I choose from the sensors output to show only the cpu core temperatures and the cpu fan speed.
# And at last simple values from the battery to see how its going. I have two batteries so I have two lines there for BAT0 and BAT1 delete the last if you have one.

watch -n 5 '
if [ -f /var/run/reboot-required ]; then
	cat /var/run/reboot-required
	cat /var/run/reboot-required.pkgs
	echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
fi
uptime;
cat /proc/meminfo | grep "MemAvailable";
echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
cat /proc/cpuinfo | grep "cpu MHz";
echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
sensors | grep -E "Core|fan"
echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "energy:|energy-full:"
upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E "energy:|energy-full:"
'
