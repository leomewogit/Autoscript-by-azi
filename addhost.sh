#!/bin/bash
clear
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "memeriksa vps anda"
sleep 1
CEKEXPIRED () {
        today=$(date -d +1day +%Y -%m -%d)
        Exp1=$(curl -sS https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/izin | grep $MYIP | awk '{print $3}')
        if [[ $today < $Exp1 ]]; then
        echo "status script aktif.."
        else
        echo "SCRIPT ANDA EXPIRED";
        exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/izin | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo "IZIN DI TERIMA!!"
CEKEXPIRED
else
echo "IZIN DI TOLAK!!";
exit 0
fi

clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
setting-menu
else
rm -fr /etc/xray/domain
echo "IP=$host" > /var/lib/scrz-prem/ipvps.conf
echo $host > /etc/xray/domain
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Dont forget to renew genssl"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
genssl
fi
