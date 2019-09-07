#!/bin/bash
pkill wifi-messages.s
ntpdate 1.ro.pool.ntp.org
python3 /usr/local/bin/wifi-messages/ssid-rotator.py
airmon-ng check kill
airmon-ng start wlan0
mdk3 wlan0mon b -s 30 -c 11 -m -v /usr/local/bin/wifi-messages/output/ssid.txt