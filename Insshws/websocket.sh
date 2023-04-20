#!/bin/bash
#date january 2022
# created bye hidessh.com
#instalasi Websocket
clear
# Websocket OpenSSH
#port 88 (OpenSSH) to 2082 (HTTP Websocket)
cd
wget -O /usr/local/bin/ws-openssh https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Insshws/openssh-socket.py.txt && chmod +x /usr/local/bin/ws-openssh
wget -O /etc/systemd/system/service-wsopenssh https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Insshws/service-wsopenssh.txt && chmod +x /etc/systemd/system/service-wsopenssh
#reboot service
systemctl daemon-reload
systemctl enable service-wsopenssh
systemctl start service-wsopenssh
systemctl restart service-wsopenssh
clear

# Dropbear WebSocket
#port 69 ( Dropbear) to 80 (HTTPS Websocket)
cd
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Insshws/dropbear-ws.py.txt && chmod +x /usr/local/bin/ws-dropbear
wget -O /etc/systemd/system/service-wsdropbear https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Insshws/service-wsdropbear.txt && chmod +x /etc/systemd/system/service-wsdropbear

#reboot service
systemctl daemon-reload
systemctl enable service-wsdropbear
systemctl start service-wsdropbear
systemctl restart service-wsdropbear
clear

# OpenVPN WebSocket
#port 1194 ( Dropbear) to 2086 (HTTP Websocket)
wget -O /usr/local/bin/edu-proxyovpn https://gitlab.com/hidessh/baru/-/raw/main/websocket-python/baru/ovpn.py && chmod +x /usr/local/bin/edu-proxyovpn
wget -O /etc/systemd/system/edu-proxyovpn.service https://gitlab.com/hidessh/baru/-/raw/main/websocket-python/baru/ovpn.service && chmod +x /etc/systemd/system/edu-proxyovpn.service
#reboot service
systemctl daemon-reload
systemctl enable edu-proxyovpn.service
systemctl start edu-proxyovpn.service
systemctl restart edu-proxyovpn.service
clear


# SSL/TLS WebSocket
#port 1194 ( Dropbear) to 2086 (HTTP Websocket)
wget -O /usr/local/bin/edu-tls https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Insshws/ws-stunnel.txt && chmod +x /usr/local/bin/edu-tls
wget -O /etc/systemd/system/edu-tls.service https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Insshws/ws-stunnel.service.txt && chmod +x /etc/systemd/system/edu-tls.service
#reboot service
systemctl daemon-reload
systemctl enable edu-tls
systemctl start edu-tls
systemctl restart edu-tls
clear

cd
wget -O /usr/local/bin/ws-tls https://raw.githubusercontent.com/Azigaming404/websocket/main/ws-tls && chmod +x /usr/local/bin/ws-tls
wget -O /etc/systemd/system/ws-tls.service https://raw.githubusercontent.com/hidessh99/projectku/main/websocket/ws-tls.service && chmod +x  /etc/systemd/system/ws-tls.service

systemctl daemon-reload
systemctl enable ws-tls
systemctl restart ws-tls
