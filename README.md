![components](/screenshot3.png)

My little bundle of telemetry.

If something feels off these are the things I look at first.\
sooo I bundled up a cosy little bash script to help me figure it out.

For the temperatures and fan speeds needs the 'lm-sensors' package!

This is a simple diagnostic bash script.\
> The whole thing wrapped up in the {watch} command so the values keep refreshing, with the -n you can modify how often this happen in seconds.\
> The {echo} writes out a neat separator line (-+-+...) between the values, it can be anything just to help you see the results better.\
> First its looking at the /var/run/reboot-required and /var/run/reboot-required.pkgs files if present than shows those files content. This works on Ubuntu I haven't tested on other distributions.\
> Next we writing out the amount of avaiable memory line from the file /proc/meminfo and values from {uptime} especially the load average to see if the processes overwhelm the cpu.\
> Then we see the current clock speed of the cpu threads.\
> The sensors line to work you need to install lm-sensors. I choose from the sensors output to show only the cpu core temperatures and the cpu fan speed.\
> And at last simple values from the battery. I have two batteries so I have two lines there for BAT0 and BAT1, delete the last if you have only one.

Tested on Ubuntu 22.04.4, 25.10
