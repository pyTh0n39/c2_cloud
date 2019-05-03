#!/bin/bash
HOSTNAME=YOUR.URL.HERE

# Root Priv Check
if [ "$(whoami)" != "root" ]; then
                echo "Sorry, you are not root."
                        exit 1
                fi

#Ensure no existing c2 instances are running

killall c2_community-linux-64

#Start Hak5 C2 Community Edition

cd /c2/
./c2_community-linux-64  -https -hostname $HOSTNAME
