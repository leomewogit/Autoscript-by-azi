#!/bin/bash
echo -e cheking update
sleep 2
rm -f /usr/bin/setting
rm -f /usr/bin/menu
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/tes/menu.sh"
wget -q -O /usr/bin/setting "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Themes/setting.sh"
sleep 1
echo -e "\e[32mUpdate Selesai...\e[0m"
chmod 777 /usr/bin/menu
chmos 777 /usr/bin/setting
rm -rf updateyes.sh
menu
