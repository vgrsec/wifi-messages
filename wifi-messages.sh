#!/bin/bash

# Kills previous wifi-messages and cleanup
pkill mdk3
airmon-ng check kill

# Sets Clock
ntpdate 1.ro.pool.ntp.org

# Set Timezone. Change this to the timezone of your event
timedatectl set-timezone America/New_York

# This rotates the SSIDs 
python3 /usr/local/bin/wifi-messages/ssid-rotator.py

# Start Broadcast
airmon-ng start wlan0
mdk3 wlan0mon b -s 30 -c 11 -m -v /usr/local/bin/wifi-messages/output/ssid.txt