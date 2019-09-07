#!/bin/bash

apt-get update
apt-get upgrade -y
apt-get install python3.6 -y
apt-get install python3-pip -y
apt-get install aircrack-ng -y
apt-get install mdk3 -y
apt-get install ntpdate -y

cd /usr/local/bin/
git clone https://github.com/vgrsec/wifi-messages.git
cd /usr/local/bin/wifi-messages
pip3 install -r ./requirements.txt
cp /usr/local/bin/wifi-messages/wifi-messages.service /etc/systemd/system/
cp /usr/local/bin/wifi-messages/wifi-messages.timer /etc/systemd/system/

systemctl start wifi-messages.timer
systemctl enable wifi-messages.timer