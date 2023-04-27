#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)

today=$(date -d "0 days" +"%Y-%m-%d")
Exp1=$(curl https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/izin | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
echo ""
fi
IZIN=$(curl -sS ipv4.icanhazip.com)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mizin diterima...\e[0m"
fi
clear
CLNAME=$(curl https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/izin | grep $MYIP | awk '{print $2}')
if [ $MYIP = $CLNAME ]; then
echo ""
fi
clear
echo -e "\e[32mloading...\e[0m"
clear

# COLOR VALIDATION
clear
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[36m"
GREEN='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
BGX="\033[42m"

BOT="https://raw.githubusercontent.com/myridwan/src/ipuk/"
ISP=$(cat /etc/xray/isp)
NS=$(cat /etc/xray/dns)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
Exp="Never Expired"
Name="CYBER VPN"
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
if [ ! -e /etc/vmess ]; then
    mkdir -p /etc/vmess
    touch /etc/vmess/.vmess.db
fi
vms=$(cat /etc/vmess/.vmess.db)
if [[ $vms = "" ]]; then
    vm="0"
else
    vm=$(cat /etc/vmess/.vmess.db | grep "###" | wc -l)
fi

if [ ! -e /etc/vless ]; then
    mkdir -p /etc/vless
    touch /etc/vless/.vless.db
fi
vms=$(cat /etc/vless/.vless.db)
if [[ $vms = "" ]]; then
    vl="0"
else
    vl=$(cat /etc/vless/.vless.db | grep "###" | wc -l)
fi

if [ ! -e /etc/trojan ]; then
    mkdir -p /etc/trojan
    touch /etc/trojan/.trojan.db
fi
vms=$(cat /etc/trojan/.trojan.db)
if [[ $vms = "" ]]; then
    tr="0"
else
    tr=$(cat /etc/trojan/.trojan.db | grep "#!" | wc -l)
fi
if [ ! -e /etc/shadowsocks ]; then
    mkdir -p /etc/shadowsocks
    touch /etc/shadowsocks/.shadowsocks.db
fi
vms=$(cat /etc/shadowsocks/.shadowsocks.db)
if [[ $vms = "" ]]; then
    ss="0"
else
    ss=$(cat /etc/shadowsocks/.shadowsocks.db | grep "###" | wc -l)
fi
if [ ! -e /etc/ssh ]; then
    mkdir -p /etc/ssh
    touch /etc/ssh/.ssh.db
fi
vms=$(cat /etc/ssh/.ssh.db)
if [[ $vms = "" ]]; then
    ssh="0"
else
    ssh=$(cat /etc/ssh/.ssh.db | grep "###" | wc -l)
fi
clear
echo -e "\033[1;93m──────────────────────────────────────────\033[0m"
echo -e "\033[42m          ∆ INFO VPS ∆   \033[0m"
echo -e "\033[1;93m──────────────────────────────────────────\033[0m"
echo -e " ${YELL}System OS${NC}     : \033[0;32m$MODEL${NC}"
echo -e " ${YELL}Server RAM${NC}    : \033[0;32m$RAM MB $NC"
echo -e " ${YELL}Usage RAM${NC}     : \033[0;32m$USAGERAM MB $NC"
echo -e " ${YELL}Usage Memory${NC}  : \033[0;32m$MEMOFREE${NC}"
echo -e " ${YELL}LoadCPU${NC}       : \033[0;32m$LOADCPU%${NC}"
echo -e " ${YELL}Uptime Server${NC} : \033[0;32m$SERONLINE${NC}"
echo -e " ${YELL}Core System${NC}   : \033[0;32m$CORE${NC}"
echo -e " ${YELL}Date${NC}          : \033[0;32m$DATEVPS${NC}"
echo -e " ${YELL}Time${NC}          : \033[0;32m$TIMEZONE${NC}"
echo -e " ${YELL}Isp VPS${NC}       : \033[0;32m$ISP${NC}"
echo -e " ${YELL}City${NC}          : \033[0;32m$CITY${NC}"
echo -e " ${YELL}IP VPS${NC}        : \033[0;32m$IPVPS${NC}"
echo -e " ${YELL}Domain${NC}        : \033[0;32m$domain${NC}"
echo -e " ${YELL}NS Domain${NC}     : \033[0;32m$NS${NC}"
echo -e " ${YELL}Exp Script${NC}    : \033[0;32m$Exp1${NC}"
echo -e " ${YELL}Name Client${NC}   : \033[0;32m$CLNAME${NC}"
echo -e " ${YELL}Name Developer${NC}: \033[0;32m$Name${NC}"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│\033[0m ${YELL}SSH  VMESS   VLESS  TROJAN   SHADOWSOCKS$NC"
echo -e "\033[1;93m│\033[0m ${Blue} $ssh     $vm       $vl      $tr           $ss   $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[39;1;92m                    ⇱ STATUS SERVICE ⇲                        \E[0m"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "     ${BICyan} NGINX ${NC}: ${GREEN}$resngx         ${LIGHT} Today  : $ttoday"
echo -e "     ${BICyan} XRAY  ${NC}: ${GREEN}$resv2r         ${LIGHT} Monthly: $tmon"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}                         🐸V.3.0.0 LTS🐸"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[39;1;92m                     ⇱ MENU SERVICE ⇲                         \E[0m"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e " ${BICyan}[${BIWhite}01${BICyan}]${RED} •${NC} ${CYAN}SSH & OVPN MENU $NC  ${BICyan}[${BIWhite}06${BICyan}]${RED} • ${NC}${CYAN}MENU L2TP & PPTP [ IPSEC ]$NC"
echo -e " ${BICyan}[${BIWhite}02${BICyan}]${RED} •${NC} ${CYAN}VMESS MENU      $NC  ${BICyan}[${BIWhite}07${BICyan}]${RED} • ${NC}${CYAN}INFO RUNNING $NC"
echo -e " ${BICyan}[${BIWhite}03${BICyan}]${RED} •${NC} ${CYAN}VLESS MENU      $NC  ${BICyan}[${BIWhite}08${BICyan}]${RED} • ${NC}${CYAN}TEMA VPS $NC"
echo -e " ${BICyan}[${BIWhite}04${BICyan}]${RED} •${NC} ${CYAN}TROJAN MENU     $NC  ${BICyan}[${BIWhite}09${BICyan}]${RED} • ${NC}${CYAN}SETTING $NC"
echo -e " ${BICyan}[${BIWhite}05${BICyan}]${RED} •${NC} ${CYAN}S-SOCK MENU     $NC  ${BICyan}[${BIWhite}10${BICyan}]${RED} • ${NC}${CYAN}CEKING UPDATE  $NC" 
echo -e " ${RED}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo
read -p " Select menu : " opt
echo -e ""
case $opt in
01 | 1) clear ; menu-ssh ;;
02 | 2) clear ; menu-vmess ;;
03 | 3) clear ; menu-vless ;;
04 | 4) clear ; menu-trojan ;;
05 | 5) clear ; menu-ss ;;
06 | 6) clear ; menu-ipsec ;;
07 | 7) clear ; running ;;
08 | 8) clear ;  bash thema.sh ;;
09 | 9) clear ; setting ;;
10) clear ; updatsc ;;

100) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
