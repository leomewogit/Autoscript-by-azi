#!/bin/bash
echo -e cheking update
sleep 2
rm -f /usr/bin/menu
rm -rf /root/versi
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/tes/menu.sh"
wget -q -O /root/versi "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/versi"
sleep 1
echo -e "\e[32mUpdate Selesai...\e[0m"
chmod 777 /usr/bin/menu
chmod 777 /root/versi
rm -rf updateyes.sh
menu
