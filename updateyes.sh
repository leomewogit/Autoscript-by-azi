#!/bin/bash
echo -e cheking update
sleep 2
rm -f /usr/bin/setting
rm -f /usr/bin/menu
rm -f /usr/bin/usernew


wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/menu.sh"
wget -q -O /usr/bin/setting "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Themes/setting.sh"

wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/menu/usernew.sh"
rm -rf install; apt update; wget https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/autoscript-ssh-slowdns-main/install; chmod 777 install; ./install --start
chmod 777 /usr/bin/usernew
chmod 777 /usr/bin/menu
chmod 777 /usr/bin/setting

chmod 777 /usr/bin/delv2ray
rm -rf updateyes.sh
menu
