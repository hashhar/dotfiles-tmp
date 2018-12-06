#!/bin/bash

# Add all songs to playlist and start ncmpcpp
urxvt -e ncmpcpp &
mpc -q clear
mpc -q ls | mpc add

# Play each song causing the notify script to be run
count=$(mpc listall | wc -l)
mpc -q play
mpc -q random off
mpc -q repeat off
mpc -q volume 0
for (( i = 0; i < count; i++ )); do
	mpc -q next
	sleep 0.5
	if (( i % 100 == 0 )); then
		echo "Done: $i/$count"
	fi
done
mpc clear
mpc -q volume 100
mpc -q random on
mpc ls | mpc add
