#!/bin/bash
echo -e cheking update
sleep 2
rm -f /usr/bin/menu
rm -rf /root/versi
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/menu.sh"
wget -q -O /root/versi "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/versi"
wget https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/setup-websocket.sh && bash-websocket.sh
sleep 1
echo -e "\e[32mUpdate Selesai...\e[0m"
chmod 777 /usr/bin/menu
chmod 777 /root/versi
rm -rf updateyes.sh
rm -rf setup-websocket.sh
menu
