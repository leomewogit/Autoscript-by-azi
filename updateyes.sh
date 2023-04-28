#!/bin/bash
echo -e cheking update
sleep 2
rm -f /usr/bin/setting
rm -f /usr/bin/menu

rm -f /usr/bin/menu-ss
rm -f /usr/bin/menu-vmess
rm -f /usr/bin/menu-vless
rm -f /usr/bin/menu-trojan

wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/menu.sh"
wget -q -O /usr/bin/setting "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Themes/setting.sh"

wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/tes/menu-ss.sh"

wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/tes/menu-vmess.sh"

wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/tes/menu-vless.sh"

wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/tes/menu-trojan.sh"

wget -q -O /usr/bin/delv2ray "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/tes/delv2ray.sh"

chmod 777 /usr/bin/menu
chmod 777 /usr/bin/setting
chmod 777 /usr/bin/menu-ss 
chmod 777 /usr/bin/menu-vmess
chmod 777 /usr/bin/menu-vless
chmod 777 /usr/bin/menu-trojan
chmod 777 /usr/bin/delv2ray
rm -rf updateyes.sh
menu
