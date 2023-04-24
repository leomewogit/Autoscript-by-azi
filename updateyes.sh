#!/bin/bash
echo -e cheking update
sleep 2
rm -f /usr/bin/setting
rm -f /usr/bin/menu
rm -f /usr/bin/usernew
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/tes/menu.sh"
wget -q -O /usr/bin/setting "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Themes/setting.sh"
wget -O /usr/local/bin/edu-proxy https://raw.githubusercontent.com/Azigaming404/websocket/main/https.py && chmod +x /usr/local/bin/edu-proxy
wget -O /etc/systemd/system/edu-proxy.service https://gitlab.com/hidessh/baru/-/raw/main/websocket-python/baru/http.service && chmod +x /etc/systemd/system/edu-proxy.service
wget -q-O /usr/bin/usernew "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/menu/usernew.sh"
systemctl daemon-reload
systemctl enable edu-proxy.service
systemctl start edu-proxy.service
systemctl restart edu-proxy.service
echo -e "\e[32mUpdate Selesai...\e[0m"
chmod 777 /usr/bin/menu
chmod 777 /usr/bin/setting
chmod 777 /usr/bin/usernew
rm -rf updateyes.sh
menu
