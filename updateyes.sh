#!/bin/bash
echo -e cheking update
sleep 2
rm -f /usr/bin/menu
rm -rf /root/versi
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/menu.sh"
wget -q -O /root/versi "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/versi"
sleep 1
echo "\e[32mInstalling bot...\e[0m"
wget https://raw.githubusercontent.com/Azigaming404/CyberCHAT_BOT/main/requirements.txt
wget https://raw.githubusercontent.com/Azigaming404/CyberCHAT_BOT/main/main.py
sudo apt install python3-pip
pip3 install -r requirements.txt
echo -e "\e[32mUpdate Selesai...\e[0m"
chmod 777 /usr/bin/menu
chmod 777 /root/versi
rm -rf updateyes.sh
menu
