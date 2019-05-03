#!/bin/bash

# Root Priv Check
if [ "$(whoami)" != "root" ]; then
                echo "Sorry, you are not root."
                        exit 1
                fi
                
# Download and install
apt-get update && apt-get install wget git unzip
mkdir /c2 && cd /c2
wget https://c2.hak5.org/download/community && mv commmunity c2_community.zip
unzip c2_community
#Download GoVanguard C2 Files
git clone https://github.com/GoVanguard/c2_cloud.git
chown -R root c2_cloud
cp c2_cloud/usr/bin/c2_start.sh /usr/bin/c2_start.sh
cp c2_cloud/etc/systemd/system/hak5c2.service /etc/systemd/system/hak5c2.service
# Enable Service to run at boot
systemctl enable hak5c2.service
Echo "All set, run the c2_start.sh to get the initial setup token. Going forward you can use the "service hak5c2 start|stop|status" commands.

