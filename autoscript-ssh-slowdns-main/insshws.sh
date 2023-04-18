#!/bin/bash

cd

wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/autoscript-ssh-slowdns-main/dropbear-ws.py
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/autoscript-ssh-slowdns-main/ws-stunnel
wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/sreyaeve/sshxrayv3/main/FILE/OPENVPN/ws-ovpn.py
wget -O /usr/local/bin/edu-proxy https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/autoscript-ssh-slowdns-main/openssh-socket.py
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
chmod +x /usr/local/bin/ws-ovpn
chmod +x /usr/local/bin/openssh

wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/sreyaeve/sshxrayv3/main/FILE/WEBSOCKET/service-wsdropbear && chmod +x /etc/systemd/system/ws-dropbear.service
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/sreyaeve/sshxrayv3/main/FILE/WEBSOCKET/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service
wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/sreyaeve/sshxrayv3/main/FILE/OPENVPN/ws-ovpn.service && chmod +x /etc/systemd/system/ws-ovpn.service
wget -O /etc/systemd/system/edu-proxy.service https://gitlab.com/hidessh/baru/-/raw/main/websocket-python/baru/http.service && chmod +x /etc/systemd/system/edu-proxy.service
systemctl daemon-reload
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
systemctl restart ws-ovpn.service
systemctl daemon-reload
systemctl enable edu-proxy.service
systemctl start edu-proxy.service
systemctl restart edu-proxy.service
