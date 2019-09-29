#!/bin/bash

# Install and Configure Hardware Clock
# https://learn.adafruit.com/adding-a-real-time-clock-to-raspberry-pi?view=all

sed -i 's/#dtparam=i2s/dtparam=i2s/g' /boot/config.txt 
echo -e '\n#Enable RTC Clock\ndtoverlay=i2c-rtc,pcf8523' >> /boot/config.txt

sudo apt-get -y remove fake-hwclock
sudo update-rc.d -f fake-hwclock remove
sudo systemctl disable fake-hwclock

sed -i '/if \[ \-e \/run\/systemd\/system \] ; then/,+3d' /lib/udev/hwclock-set
sed -i 's/\/sbin\/hwclock --rtc=$dev --systz --badyear//g' /lib/udev/hwclock-set
sed -i 's/\/sbin\/hwclock --rtc=$dev --systz//g' /lib/udev/hwclock-set

date
hwclock -w

# Set Timezone to Eastern Daylight Time 
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime

# Install Everything Required to Rotate SSID

apt-get update
apt-get upgrade -y
apt-get install git
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

systemctl start wifi-messages.timer
systemctl enable wifi-messages.timer
systemctl start wifi-messages-restart.service
systemctl enable wifi-messages-restart.service

reboot