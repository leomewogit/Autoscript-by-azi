#!/bin/bash

# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting

domain=$(cat /etc/xray/domain)
sldomain=$(cat /root/nsdomain)
cdndomain=$(cat /root/awscdndomain)
slkey=$(cat /etc/slowdns/server.pub)
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                 ⇱ CREATE ACCOUNT ⇲                 \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${CYAN}"
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"

ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
systemctl stop client-sldns
systemctl stop server-sldns
pkill sldns-server
pkill sldns-client
systemctl enable client-sldns
systemctl enable server-sldns
systemctl start client-sldns
systemctl start server-sldns
systemctl restart client-sldns
systemctl restart server-sldns
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
clear
echo -e ""
echoecho -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                 ⇱ INFORMASI AKUN SSH ⇲                 \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${CYAN}Username: $Login"
echo -e "Password: $Pass"
echo -e "Created: $hariini"
echo -e "Expired: $expi"
echo -e "${GREEN}=================HOST-SSH===================="
echo -e "IP/Host: $IP"
echo -e "Domain SSH: $domain"
echo -e "Domain Cloudflare: $domain"
echo -e "PubKey : $slkey"
echo -e "Nameserver: $sldomain"
echo -e "${GREEN}===============Service-Port=================="
echo -e "OpenSSH: 22"
echo -e "Dropbear: 44, 69, 143"
echo -e "SSL/TLS: 447"
echo -e "SSH Websocket SSL/TLS: 8443"
echo -e "SSH Websocket HTTP: 8080"
echo -e "SSH Websocket Direct: 8080"
echo -e "BadVPN UDPGW: 7100,7200,7300"
echo -e "Proxy CloudFront: [OFF]"
echo -e "Proxy Squid: [ON]"
echo -e "=================================================="
echo -e "SNI/Server Spoof: isi dengan bug"
echo -e "Payload Websocket SSL/TLS"
echo -e "=================================================="
echo -e "GET wss://bug.com/ HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=================================================="
echo -e "Payload Websocket HTTP"
echo -e "=================================================="
echo -e "GET / HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "${GREEN}=========================================="
echo -e "Payload Direct Worryfree 8080" 
echo -e "=================================================="
echo -e "GET /worryfree HTTP/1.1[crlf]host: tsel.me[crlf]Connection: keep-alive[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=================================================="
echo -e "${CYAN}     Terimakasih sudah menggunakan" 
echo -e "${CYAN}        script premium CyberVPN"
echo -e "${GREEN}=========================================="
