#!/bin/bash

HERE=$(xdotool getwindowfocus)

ULX=$(xwininfo -id "$HERE" | grep "  Absolute upper-left X:" | awk '{print $4}')
ULY=$(xwininfo -id "$HERE" | grep "  Absolute upper-left Y:" | awk '{print $4}')

# If there is no window, ULX == 1 and ULY == 1.
if [[ "$ULX" != "-1" ]] || [[ "$ULY" != "-1" ]]; then
    eval "$(xdotool getwindowgeometry --shell "$HERE")"

    NX=$(( WIDTH / 2 ))
    NY=$(( HEIGHT / 2 ))

    xdotool mousemove --window "$WINDOW" "$NX" "$NY"
fi
