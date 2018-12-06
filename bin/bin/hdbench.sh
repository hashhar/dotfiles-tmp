#!/bin/bash

# Normal write speed
printf 'Performing Normal write test\n'
dd if=/dev/zero of=tempfile bs=1M count=1024 conv=fdatasync,notrunc status=progress

# Normal read speed
printf 'Performing Normal read test\n'
echo 3 | sudo tee /proc/sys/vm/drop_caches
dd if=tempfile of=/dev/null bs=1M count=1024 status=progress

# Disk cache read speed
printf 'Performing Disk Cache read test\n'
dd if=tempfile of=/dev/null bs=1M count=1024 status=progress

rm tempfile
