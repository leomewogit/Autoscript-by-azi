#!/bin/bash
clear
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
blue='\033[0;34m'
ungu='\033[0;35m'
Green="\033[32m"
Red="\033[31m"
WhiteB="\e[5;37m"
BlueCyan="\e[5;36m"
Green_background="\033[42;37m"
Red_background="\033[41;37m"
Suffix="\033[0m"


echo -e "${BlueCyan}==================================================${NC}"
echo -e "${yellow}                     menu settings"
echo -e "${BlueCyan}__________________________________________________${NC}"
echo -e "${WhiteB}"
echo
echo "[1].Default Themes"
echo "[2].Renew Cert"
echo "[3].Dns pointing fix"
echo "[4].Themes"
echo -e "${BlueCyan}"
read -p    "Pilih Nomor :" bro


if [ $bro = 1 ] || [ $bro = 1 ]
then
rm -rf /usr/bin/menu
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/tes/menu.sh" && chmod 777 /usr/bin/menu
fi
