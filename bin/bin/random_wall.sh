#!/bin/bash

DIR="$HOME/Pictures/Wallpapers"
LOCK_FILE="/tmp/random_wall.lock"

if [[ ! -d "$DIR" ]]; then
    echo "$DIR does not exist"
    exit 1
fi

setbg () {
    NUM_FILES=$( find "$DIR" -type f | wc -l )
    RAND_NUM=$(( RANDOM % NUM_FILES ))
    test ! $RAND_NUM = 0 || RAND_NUM=1

    RAND_FILE="$( find "$DIR" -type f | head -n $RAND_NUM | tail -n 1)"

    feh --bg-fill "${RAND_FILE}"
}

if [[ -f "$LOCK_FILE" ]]; then
    setbg
    exit 1
fi

touch "$LOCK_FILE"

while true; do
    setbg
    sleep 600
    rm "$LOCK_FILE"
    touch "$LOCK_FILE"
done
