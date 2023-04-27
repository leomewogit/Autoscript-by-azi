#!/bin/bash
echo -e cheking update
sleep 2
rm -f /usr/bin/setting
rm -f /usr/bin/menu
rm -f /usr/bin/usernew
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/menu.sh"
wget -q -O /usr/bin/setting "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Themes/setting.sh"




chmod 777 /usr/bin/menu
chmod 777 /usr/bin/setting

rm -rf updateyes.sh
menu
