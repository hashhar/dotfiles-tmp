#!/bin/bash

# Add all songs to playlist and start ncmpcpp
mpc -q clear
mpc -q ls | mpc add
urxvt -e ncmpcpp &

# Play each song causing the notify script to be run
count=$(mpc listall | wc -l)
mpc -q play
mpc -q volume 0
mpc -q random off
mpc -q repeat off
for (( i = 0; i < count; i++ )); do
	mpc -q next
	sleep 0.5
	if (( i % 100 == 0 )); then
		echo "Done: $i/$count"
	fi
done
mpc clear

# vim: set fdm=marker fen:
