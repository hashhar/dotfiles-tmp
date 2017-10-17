#!/bin/bash

DIR="$HOME/Pictures/Wallpapers"

if [ ! -d "$DIR" ]; then
    echo "Not Exist $DIR"
    exit 1
fi

setbg () {
    NUM_FILES=$( find "$DIR" -type f | wc -l )
    RAND_NUM=$(( RANDOM % NUM_FILES ))
    test ! $RAND_NUM = 0 || RAND_NUM=1

    RAND_FILE="$( find "$DIR" -type f | head -n $RAND_NUM | tail -n 1)"

    feh --bg-fill "${RAND_FILE}"
}

if [ -f "/tmp/random_wall.lock" ]; then
    setbg
    exit 1
fi

touch /tmp/random_wall.lock

while true; do
    setbg
    sleep 3600
    rm /tmp/random_wall.lock
    touch /tmp/random_wall.lock
done
