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

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ MENU SETTING ⇲                 \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${WhiteB}"
echo
echo "[1].Add Host"
echo "[2].Renew Cert"
echo "[3].Free domain DNS"
echo "[4].limit speed"
echo "[5].speedtest"
echo "[6].kill all proces"
echo "[7].clear log"
echo "[8].reboot"
echo "[9].Autoreboot"
echo "[10].Change Banner Dropbear"
echo "[11].Auto kill multi login"
echo "[12].limit speed vps"
echo "[13].restart all service"
echo "[14].WEBMIN"
echo "[15].Cek semua port"
echo "[16].Slowdns setting"
echo "[17].Menu Backup"
echo "[18].About"
echo -e "${BlueCyan}"
echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p    "Pilih Nomor :" bro


if [ $bro = 1 ] || [ $bro = 1 ]
then
addhost
fi
if [ $bro = 2 ] || [ $bro = 2 ]
then
clear
genssl
fi
if [ $bro = 3 ] || [ $bro = 3 ]
then
clear
fix
fi
if [ $bro = 4 ] || [ $bro = 4 ]
then
clear
limitspeed
fi
if [ $bro = 5 ] || [ $bro = 5 ]
then
clear
cek-speed
fi
if [ $bro = 6 ] || [ $bro = 6 ]
then
clear
echo "kill all proces in your cpu"
killall /bin/bash /usr/bin/menu
fi
if [ $bro = 7 ] || [ $bro = 7 ]
then
clear
clearlog
fi
if [ $bro = 8 ] || [ $bro = 8 ]
then
clear
echo "Bobo dulu ye guys" | lolcat
sleep 2
reboot
fi
if [ $bro = 9 ] || [ $bro = 9 ]
then
clear
autoreboot
fi
if [ $bro = 10 ] || [ $bro = 10 ]
then
clear
nano /etc/issue.net
fi

if [ $bro = 11 ] || [ $bro = 11 ]
then
clear
tendang
fi
if [ $bro = 12 ] || [ $bro = 12 ]
then
clear
limitspeed
fi
if [ $bro = 13 ] || [ $bro = 13 ]
then
clear
restart
fi
if [ $bro = 14 ] || [ $bro = 14 ]
then
clear
wbm
fi
if [ $bro = 15 ] || [ $bro = 15 ]
then
clear
netstat -tnlp
fi
if [ $bro = 16 ] || [ $bro = 16 ]
then
clear
bash wslow.sh
fi
if [ $bro = 17 ] || [ $bro = 17 ]
then
menu-backup
fi
if [ $bro = 18 ] || [ $bro = 18 ]
then
clear
neofetch
echo -e "${yellow}"
cat /root/log-install.txt
echo "--------------------------------------------------------------"
echo "                Terimakasih sudah menggunakan" 
echo "                   script premium CyberVPN"
echo "--------------------------------------------------------------"
fi
