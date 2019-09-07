#!/bin/bash

apt-get update
apt-get upgrade -y
apt-get install python3.6 -y
apt-get install python3-pip -y
apt-get install aircrack-ng -y
apt-get install mdk3 -y
apt-get install ntpdate -y

# apt-get install gcc -y
# apt-get install autoconf -y
# apt-get install git-y

# wget https://download.aircrack-ng.org/aircrack-ng-1.5.2.tar.gz
# tar -zxvf aircrack-ng-1.5.2.tar.gz
# cd aircrack-ng-1.5.2
# autoreconf -i
# ./configure --with-experimental
# make
# make install
# ldconfig

cd /usr/local/bin/
git clone https://github.com/vgrsec/wifi-messages.git
cd /usr/local/bin/wifi-messages
pip3 install -r ./requirements.txt
cp /usr/local/bin/wifi-messages/wifi-messages.service /etc/systemd/system/
cp /usr/local/bin/wifi-messages/wifi-messages.timer /etc/systemd/system/

systemctl start wifi-messages.timer
systemctl enable wifi-messages.timer