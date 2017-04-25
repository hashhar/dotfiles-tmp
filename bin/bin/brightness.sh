#!/bin/bash

backlight()
{   # usage: backlight int (on a scale of 0 to 1000)
    local files=(
        /sys/class/backlight/intel_backlight/brightness
    )
    echo $1 | sudo tee ${files[@]}
}

[ $# -ne 0 ] && backlight $1 && exit 0
if cat /sys/class/power_supply/BAT0/status | grep -q Discharging
then
    backlight 1
    xbacklight -set 40
    exit 1
else
    backlight 400
    xbacklight -set 100
    exit 0
fi
