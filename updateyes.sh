#!/bin/bash
echo -e cheking update
sleep 2
rm -f /usr/bin/setting
rm -f /usr/bin/menu
rm -f /usr/bin/usernew
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/tes/menu.sh"
wget -q -O /usr/bin/setting "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Themes/setting.sh"
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1CCEp3uoQ5E4LxkydfzcM7yD6elos6Ufh' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1CCEp3uoQ5E4LxkydfzcM7yD6elos6Ufh" -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udpwget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/menu/usernew.sh"
echo -e "\e[32mUpdate Selesai...\e[0m"
chmod 777 /usr/bin/menu
chmod 777 /usr/bin/setting
chmod 777 /usr/bin/usernew
rm -rf updateyes.sh
menu
