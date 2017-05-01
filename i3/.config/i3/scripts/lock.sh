#!/bin/bash

# Depends on: imagemagick, i3lock, scrot

IMAGE=/tmp/lockscreen.png
TEXT=/tmp/locktext.png
ORIG_ICON=lock.png
ICON=/tmp/icon.png

scrot $IMAGE
convert $IMAGE -scale 10% -scale 1000% $IMAGE
[ -f $ICON ] || cp $ORIG_ICON $ICON
[ -f $TEXT ] || {
    convert -size 3000x60 xc:white -font Fira-Sans -pointsize 26 -fill black -gravity center -annotate +0+0 'Type password to unlock' $TEXT;
    convert $TEXT -alpha set -channel A -evaluate set 50% $TEXT;
}
convert $IMAGE $TEXT -gravity center -geometry +0+200 -composite $IMAGE
convert $IMAGE $ICON -gravity center -composite -matte $IMAGE
i3lock -b -e -i $IMAGE
