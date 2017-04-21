#!/bin/sh

sudo dhcpcd -k --release
sudo systemctl restart dhcpcd.service
