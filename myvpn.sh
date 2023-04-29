#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "memeriksa vps anda"
sleep 0.5
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
echo "Akses di tolak!! Benget sia hurung!!";
exit 0
fi


localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
if [ -f "/root/log-install.txt" ]; then
rm -fr /root/log-install.txt
fi
mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain

ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
sleep 2

mkdir -p /var/lib/scrz-prem >/dev/null 2>&1
echo "IP=" >> /var/lib/scrz-prem/ipvps.conf

sudo apt install vnstat
sudo apt insta squid
wget -q -O https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/tools.sh && chmod +x tools.sh && ./tools.sh
rm tools.sh
clear

clear
echo "Add Domain for vmess/vless/trojan dll"
echo " "
read -rp "Input ur domain : " -e pp
    if [ -z $pp ]; then
        echo -e "
        Nothing input for domain!
        Then a random domain will be created"
    else
        echo "$pp" > /root/scdomain
	echo "$pp" > /etc/xray/scdomain
	echo "$pp" > /etc/xray/domain
	echo "$pp" > /etc/v2ray/domain
	echo $pp > /root/domain
        echo "IP=$pp" > /var/lib/scrz-prem/ipvps.conf
    fi

clear
#install ssh ovpn
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install SSH / WS               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/autoscript-ssh-slowdns-main/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
sleep 2
wget https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/nginx-ssl.sh && chmod +x nginx-ssl.sh && ./nginx-ssl.sh
wget -q -O kanyut.sh https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/kanyut.sh && chmod +x kanyut.sh && ./kanyut.sh
#install ssh ovpn
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install Websocket              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Insshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh

#exp
cd /usr/bin
wget -O xp "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/xp.sh"
chmod +x xp
sleep 1
wget -q -O /usr/bin/notramcpu "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Finaleuy/notramcpu" && chmod +x /usr/bin/notramcpu

cd
#remove log 
#wget -q -O /usr/bin/removelog "https://github.com/andristji/Xray-SSH/raw/main/log.sh" && chmod +x /usr/bin/removelog
#sleep 1
rm -f /root/ins-xray.sh
rm -f /root/insshws.sh
rm -f /root/xraymode.sh
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install ALL XRAY               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
wget -q -O ins-xray.sh https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
sleep 1
wget -q -O senmenu.sh https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/senmenu.sh && chmod +x senmenu.sh && ./senmenu.sh
sleep 1
#install slowdns
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install slowdns               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2

rm -rf install; apt update; wget https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/autoscript-ssh-slowdns-main/install; chmod 777 install; ./install --start
#cronjob
#echo "30 * * * * root removelog" >> /etc/crontab

#pemangkuvmessvless
mkdir /root/akun
mkdir /root/akun/vmess
mkdir /root/akun/vless
mkdir /root/akun/shadowsocks
mkdir /root/akun/trojan

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install IPSEC L2TP & SSTP               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 1
wget https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/ipsec/ipsec.sh
bash ipsec.sh
#install remove log
echo "0 5 * * * root reboot" >> /etc/crontab
echo "* * * * * root clog" >> /etc/crontab
echo "59 * * * * root pkill 'menu'" >> /etc/crontab
echo "0 1 * * * root xp" >> /etc/crontab
echo "*/5 * * * * root notramcpu" >> /etc/crontab
service cron restart
clear
org=$(curl -s https://ipapi.co/org )
echo "$org" > /root/.isp

cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile
if [ -f "/root/log-install.txt" ]; then
rm -fr /root/log-install.txt
fi
cd
echo "1.0.0" > versi
clear
rm -f ins-xray.sh
rm -f senmenu.sh
rm -f setupku.sh
rm -f xraymode.sh
rm -f slow.sh
echo "=====================-[  CyberVPN  ]-===================="
echo ""
echo "------------------------------------------------------------"
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22, 53, 2222, 2269"  | tee -a log-install.txt
echo "   - SSH Websocket           : 80" | tee -a log-install.txt
echo "   - SSH SSL Websocket       : 443" | tee -a log-install.txt
echo "   - Stunnel5                : 222, 777" | tee -a log-install.txt
echo "   - Dropbear                : 109, 143" | tee -a log-install.txt
echo "   - Badvpn                  : 7100-7300" | tee -a log-install.txt
echo "   - Nginx                   : 81" | tee -a log-install.txt
echo "   - XRAY  Vmess TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vmess None TLS    : 80" | tee -a log-install.txt
echo "   - XRAY  Vless TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vless None TLS    : 80" | tee -a log-install.txt
echo "   - Trojan GRPC             : 443" | tee -a log-install.txt
echo "   - Trojan WS               : 443" | tee -a log-install.txt
echo "   - Trojan GO               : 443" | tee -a log-install.txt
echo "   - Sodosok WS/GRPC         : 443" | tee -a log-install.txt
echo "   - SLOWDNS                 : 53"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Change port" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""
echo ""
echo "------------------------------------------------------------"
echo ""
echo "===============-[ Script Credit By AZI 😀 ]-==============="
echo -e ""
echo ""
echo "" | tee -a log-install.txt
echo "ADIOS"
sleep 1
echo -ne "[ ${yell}WARNING${NC} ] Do you want to reboot now ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
exit 0
else
reboot
fi
#!/bin/bash

God="BlessYou";krF=FoL;Gnr=Vl;QIy=Is;UOt=FC;kVE=Sk;KlM=gM;Xwe=TF;oTX=dD;Yox=Qa;wQx=mb;Kqb=Zy;xWU=twB;gTp=auw;hwZ=Ejp;tHg=iQZ;ojo=shb;jhw=FjF;IDL=klV;wOA=yFT;PZL=XfL;DRJ=DiE;bmJ=FCa;XGN=dOT;QCK=dkY;SOb=WJE;RJx=uAv;czJ=dts;VGB=oCy;TyO=xGj;yHU=bpq;Nfb=Wct;doQ=Ibf;XCL=rax;ZNH=Hhf;Eoh=yCU;ghd=hut;ooz=VKY;qMf=PrY;Ecf=Lke;BbJ=jie;QOI=lOT;oi=QkU;yM=iDO;rT=twI;wa=BEk;Lf=SGl;Sx=Kri;yL=RiF;Xf=iZT;iv=fpC;fW=nki;qX=FrL;ba=OUY;czP=Hdm;ecN=WKt;QMW=BnB;Nsq=jdC;nof=OZt;bhx=qNV;vVN=xaU;smp=Wta;ceY=GDh;AIB=juO;miA=Cso;zgz=Hka;Kea=YMq;hUp=SWY;zMP=ozk;WGK=JEt;pkF=jjF;FCq=pFs;ZrQ=VcQ;ZjS=do;BTP=Su;sly=xM;aZl=vF;iJn=bo;QCl=HB;SCO=xo;fUq=Jo;Epq=zc;wxq=Ev;ziJ=Gx;Kzo=JF;PDO=pJ;qhq=yp;OYk=rj;OGy=Cc;hSK=xR;lnD=um;UXi=pl;xBF=xP;qOD=iX;RVy=nl;mqe=JK;rQt=CA;qJD=FR;sPp=XZ;moh=DC;Fsj=GWh;NTx=Jnx;dwG=ncr;Ugd=mFV;ZTt=WjI;mFG=lms;YGK=bPI;UKs=ibv;hka=JFE;zpQ=Gxt;VlF=Jxk;AEJ=cuk;SUZ=YiV;Wfq=NhZ;xLp=ray;QmE=mqM;fkp=tHl;Sek=XvT;qbj=EKu;RfA=xSe;fPQ=Oll;cif=jtg;GYE=yei;Prw=RTD;sMB=pEL;sxA=APb;aRs=HgZ;SXm=VSI;lZA=UKc;YMw=Lct;bwO=XQI;OxQ=COX;bPh=KqP;GVr=hRx;eoA=eID;AZK=fFj;PGC=XPy;ieV=gly;AUO=yit;GjW=jaZ;tBB=HSO;vdV=efl;HiW=VHx;JaQ=RCo;cGr=fsk;eib=jty;TPK=rlb;dhM=oDt;tCL=muK;gAg=xQq;xWl=eMt;AtB=mbQ;UzS=lee;xjU=CPZ;qLS=iIg;dQw=NHN;Dum=qAc;aei=Whw;afz=OcR;NWZ=Txs;gzI=HsZ;YmH=IIm;kZc=Ppd;qnZ=vjw;sQw=BmF;PAB=rGe;gah=aHu;XfD=uJJ;LmJ=PUK;jCz=XpN;gTg=hRF;cpS=fhx;wFI=fih;pHM=aTH;GIm=Jtb;XDy=XGY;zMs=kPd;VtP=pbP;ALj=acU;HEZ=Tre;EPr=vOf;eSC=AIk;TXH=szR;nNa=bGD;lQt=Qod;Qvm=HGI;tkS=IOY;qmZ=tDf;xxx=xOS;pFg=XCd;aVR=xGh;ooR=AHX;JVj=laY;TvM=kEx;SYU=hol;ddj=khS;aPP=oiI;Edo="
";DSi=WYX;LHA=Gfx;VgU=gJZ;Rxh=xYy;bXG=gvs;eLoP="e";u18="6";Yt="l";Yxgs="";qwt="Fu";ieC=HO;XcH=Rv;Ugs=LC;vD=xp;fy=oW;Zl=LhH;oP=Jm;sDA=kpY;GHn=TB;wzk=Da;oiO=Ei;NaM=hIf;fC=vjz;kT=rz;sV=bZz;CL=ARL;Wc=dA;gZG=tGI;vpk=cM;Aao=tgy;sU=ld;LZ=Pr;BE=wCX;iN=fQ;RCe=Dm;Rc=Fl;Njo=OMq;gtb=SKa;Wf=jMB;Dm=wHr;Nx=Wn;ANT=jAK;oFy=Bnc;IjZ=Xj;DQa=oK;ewZ=Vm;QPf=lz;Cwg=aS;KEM=jS;fkE=hM;nLw=ym;FWv=BC;aDC=Lw;tW=Rgn;kw=Hgf;tQ=eSh;Fi=iGb;Or=snM;ZG=xqx;xC=WJr;Bf=haC;pT=THr;By=jbu;tm=Hcy;eT=nTC;UT=KCa;dk=Pxy;vG=TvX;HX=MMB;Ow=ZoT;UJ=LvE;rx=oMF;EB=VZx;OC=IfU;dv=lTx;Nk=TNq;Ej=bKu;dl=ZZi;yzL=bJ;EiG=LJ;iqg=gK;fbd=vg;OPl=Ei;tnI=YS;yBV=DA;yxh=Ks;Nic=Ih;wMq=tD;iDs=AQ;Nhh=zy;JWe=Ry;gC=AnI;qWN=uq;hIc=OAL;UOm=Nq;Xj=ax;GW=utn;Fmc=CaI;zeK=eT;hI=sl;Ae=RK;XV=doy;Dpq=Eg;Mmr=MZg;CXd=Bao;RND=WUC;CGm=SRK;DJh=LZw;ym=Ah;xzv=IX;FYi=YUX;v6T=" ";RzE="xsVZcdSPkVmcKkSbvNmLwlmehhmbhNWauQjdwlGITNXLgwmc1NGKk0DUJlVTKg2chJ2LulmYvEyI KcSb2MzOxsVZcdSPlVHbilHdKcSbzMzOxsVZcdSPsxWZ5pwJtJzM7AzWlx1J94WZlJ3ZKcSbxMzO oNWZKsTKwl2LvlmLvZmbpBXag0yTx1CI0V2Z3hCJ9AVSZ1kCn5Wa0RXZHByIKowJtBzWlx1J9MkT gACIgACIgAiC7BSKoACRFJVSQhVRLV0QKUjLwACclVGbzpgIhRmbhBycwZHIhN3apJXZtVWbiAyb z1CIsJXdjhCJ9EDc4VEIgACIgACIgoQKkVSLg0WJtASWlsCI5FGZxsCIk1CIlRXYkhCJ9kXYk9Gd pJ3Yz9Gd1F0L0ADNn5WatF2ZppXQv02bj5CduVGdu92YyV2c1JWdoRXan5ydhJ3LvozcwRHdoByU gACIgoQKn03MkACdulmcwt3Jgs2dhBCfgAVSZ1EJgAXZydGI8BibppXav4Wah12LppXYtknYtQHc jNHIzVHdhR3ciAyboNWZgACIgACIgAiCuVGa0ByOd1FIxAHeFRCI8ASehR2b0RCIbtFImlGIgACI JBFWFBSQE5UQgQFUJJ1QTJCIvh2YlBCIgACIgACIKU2csVGIgACIgACIgogIu4iZpR3ahBCdwlmc 0l2ZucXYy9yL6MHc0RHagM1ctACbyV3YoQSPOlkWJpQfKkmZKADI0lGelBCIgACIgACIKsjIEVkU 6l2LulWYt9Sa6FWL5JWL0BXayN2cvRXdB9CNwQzZulWbhdWa6F0Lt92YuQnblRnbvNmclNXdiVHa 70FIOlkWJRCI9ACUJlVTkAyWgYWaKkCUJlVTkACclJ3ZgwHIn0HNkACdulmcwt3Jgs2dhBCfg4Wa zV2crFkIg8GajVmClNHblpARFJVSQhVRLV0QKISIhEUTJJVRUBSSEBiTJpVSiAyboNWZK4WZoRHI ohCJ9AXasF2YvxmCKoQampAMgQXa4VmC7ISIhcmb1JXdoBSYpNHI0V2ZuVmQgESIrFGbvRHIpRGI gQXYjhCJ9QnchRmCpACYl1WYuR3cvhGYggSP0NHaKkSMm1CIgwFZtACd1NGI8BSStASZtFmb0N3b btFImlmCpcSfyQCI05WayB3enAya3FGI8BCYl1WYuR3cvhGYgcXLgAXZydGI8Byc0N3bo9yY0V2L +AiIpUWbh5Gdz9GaoQCIwlGbhN2bsRiIg8GajVmCuVGa0ByOd1FIiQnchRGJiASPhAiI0NHakICI ypgblhGdgsTXgICd4RnLsxWY0Nnbp1yZvx2L092by9iIgYWLgsFImlmCpZmCzR3cvh2LjRXZvAiP tAicpR2atpQehJHevMGdl9CIw1CIylGZr1mCpZmC0hHduwGbhR3culWLn9GbvQ3bvJ3LgInZtASb h12bk9SehJnM29yY0V2Lgg2Y19GdK4Wah12bk9SehJHevMGdl9CIoNWdvRnC5FmcyY3LjRXZvACc uxmCK4Wah12bkN2cvkXYyJjdvMGdl9CIoNWdvRnCulWYt9GZjN3L5Fmc49yY0V2Lgg2Y19GdK4Wa jNXezpQZtlGdsF2Yvx2LjRXZvASY0JXYrFmSvEWazF0LvZmbpVmbvp3LlJXYoN3LyNXdvAycm1CI 5NnCxYiPyACbsVnbvYXZk9iPgETP2YHcp9VZsJWYzlGZuwGbh5iZu92YuYjdwlmL0VmbgcXLgwGd yACbsVnbvYXZk9iPgETP2YHcp9VZsJWYzlGZuQHb1FmZlRmLm52bj5iN2BXauQXZuBydtACb0N2c gwGbhR3culGI0BXYKEjJ+IDIsxWdu9idlR2L+ASetACbyV3YgQXanBCbsFGdz5WagQHchpgCxYiP g0FI9NkT7RyTG5US95WZlJ3Z7RCIbJCIl1CIvh2YlpQMm4jMgwGb152L2VGZv4DI51CIu9Ga0lHc ylGZr1mCKIDIwVWZsNnCikHZhVmcgMXagUGbpZGIu9Wa0FGbsFGdz5Wag4iLuACZv92ZgQHanlWQ yFmdvAiP+AiI9AVSiAyboNWZKEjJ+IDIsxWdu9idlR2L+ASblJHctoncjN3LilGbvIXY29CIw1CI hBybkV3cKQXY0Nnb2BCbsFGdz5WagQHchBybkV3cKogZu92YuMHc2BXav0WZyBXL6J3Yz9iYpx2L j5CduVGdu92YyV2c1JWdoRXan5ydhJ3LvozcwRHdoByTtASctACdld2dKQWa1F3cgEGdz5WagQHc gQ2bth2YgYiJgg2cuMHbv9Gdv4Wah12LppXYtknYtQHcpJ3Yz9Gd1F0L0ADNn5WatF2ZppXQv02b iAyboNWZKIXYlx2YKogchVGbjpAaz5ycs92b0BSbypAaz5ycs92b09iLgYiJgg2cuMHbv9Gdgg3K gAnctACZhVmcKICIiAyboNWZKICbsRGIuFmavJHdvM3clxmdvM3cl1mdgI3bmBibpFWbvREIkRWQ gACIgACIK4WZoRHI70FIwBHJgoXLgsFImlGIgACIKAHcgUWLgICI6AibpFWbvRGIyVHI0VHculkI lhGVgACIgACIgAiCh4Wah12bkBicvZGI0VHculGIn5WaoR3bOBCIgACIgACIKICIl1CIvh2YlBCI g8GajVGIgACIgACIgoQZzxWZgACIgogIkVGdhVmcjBSZiBCbsl2dg4Wah12bkBSbvRmbhJHIhBib JogbpFWbvR2Yz9SehJHevMGdl9CI+AiIwBHJiAyboNWZJogbpFWbvR2Yz9Cdv9mcvAiPgICcwRiI vR2L5FmcyY3LjRXZvAiPgICcwRiIg8GajVWCK4Wah12bk9SehJHevMGdl9CI+AiIwBHJiAyboNWZ hZ3Lg4DIiAHck0DUJJCIvh2YlBCIgACIgACIK4Wah12bk9Cdv9mcvAiPgAHckAyboNWZJogbpFWb wZ3bgg2czBCbsFGdz5WajogchVGbjpgCpZGIgACIKYmbvNmLzBndwl2LtVmcw1ieyN2cvIWas9ic iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIli32MzsVZcJCIl1CIvh2Ylpgb iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIl gACITdFIvACSTNFIsxWY0NnbJBCIgACIg4WZlJ3ZkICIl1CIvh2YlpgItBzWzMDMcFIliHIliHIl iHIliHIliHIliHIliHIliHIliHIliHIli32MzsVZcJCIl1CIvh2YlpgID5EJgACIgACIgACIgACI iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIl 6MHc0RHagQXZndnCyFWZsNmCyACclVGbzpgItBzWzMDMcFIliHIliHIliHIliHIliHIliHIliHIl 6FWL5JWL0BXayN2cvRXdB9CNwQzZulWbhdWa6F0Lt92YuQnblRnbvNmclNXdiVHa0l2ZucXYy9yL 4tCIk9WboNGImYCIoNnLuBndtg2cz9ibpFWbtMnbkd3bsNXLoN3ctQHcpJ3Yz9Gd1F2LulWYt9Sa oRXan5ydhJ3LvozcwRHdoBCdld2dKIDIwVWZsNnCoNnLuBndtg2cz9iLgYiJgg2cu4Gc21CazNHI pdmbv4Wah12LppXYtknYtQHcpJ3Yz9Gd1F0L0ADNn5WatF2ZppXQv02bj5CduVGdu92YyV2c1JWd 0V2Z3pAaz5CbzNXL45Wan52LuAiJmACaz5CbzNXL45Wan5GI4tCIk9WboNGImYCIoNnLsN3ctgnb tF2ZppXQv02bj5CduVGdu92YyV2c1JWdoRXan5ydhJ3LvozcwRHdoBCaz5Cd1lnbhtGIP1CIx1CI 1lnbhtGI4tCIk9WboNGImYCIoNnL0VXeuF2av4Wah12LppXYtknYtQHcpJ3Yz9Gd1F0L0ADNn5Wa iHIli32MzsVZcJCIl1CIvh2YlpgbwZ3bgg2czBCbsFGdz5WajoAaz5Cd1lnbht2LuAiJmACaz5Cd iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIl vh2YlpgItBzWzMDMcFIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIl vh2YlpgID5EJgACIgACIgACIgACIgACdlt2YvNnYldFIsxWY0NnbJBCIgACIg4WZlJ3ZkICIl1CI iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIli32MzsVZcJCIl1CI iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIl lRnbvNmclNXdiVHa0l2ZucXYy9yL6MHc0RHagQXZndnCyFWZsNmCyACclVGbzpgItBzWzMDMcFIl 3h2cz5WavM3doN3cul0LulWYt9Sa6FWL5JWL0BXayN2cvRXdB9CNwQzZulWbhdWa6F0Lt92YuQnb yNXdvACZjpAc4V2IKoAaz5yc3h2cz5Wav4CImYCIoNnLzdHazNnbpBCerACZv1GajBiJmACaz5yc tF2ZppXQv02bj5CduVGdu92YyV2c1JWdoRXan5ydhJ3LvozcwRHdoJCIwhHIP1CI0V2Z3pgbpJ2L KEDIwVWZsNnCwhHI4tCIk9WboNmCig2cuAHev4Wah12LppXYtknYtQHcpJ3Yz9Gd1F0L0ADNn5Wa 052bjJXZzVnY1hGdpdmL3Fmcv8iOzBHd0hmIgUHcj1WYyR3bu9ibpJ2LyNXdvAyTtASctACdld2d yR3bu9Se1VGbh5WaG9ibpFWbvkmeh1Sei1CdwlmcjN3b0VXQvQDM0cmbp1WYnlmeB9SbvNmL05WZ 3NiCgc2bsBSZ29WblJ3IKQ2YKoQdwNWbhJHdv52LulmYvI3c19CI4tCIk9WboNGImYCIiUHcj1WY qR3cpJHZuF2Lt92YuIWdoRXan9yL6MHc0RHaiAyZvxWZ29WblJ3LulmYvI3c19CIP1CIx1CI0V2Z vxWZ29WblJ3LulmYvI3c19CI4tCIk9WboNGImYCIig2cuc2bs9ibpFWbvcXYy9CSTNVL5FmcY9Sa oNnLzdHazNnbp9Cdv9mcvAiZtASbypAaz5SehJHetMnbp9Cdv9mcvAiZtASbypQMgAXZlx2cjowZ UKegUKegUKegUKebzMzWlxlIgUWLg8GajVmCyFWZsNmCoNnLlR2btlXYyh3L092by9CIm1CItJnC UKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKeg nRiIgUWLg8GajVmCi0GMbNzMwwVgUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKeg lxlIgUWLg8GajVmCiMkTkACIgACIgACIgACIgACIgkVQShFIMxUQgwGbhR3culEIgACIgAiblVmc UKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKebzMzW bNzMwwVgUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKeg yV2c1JWdoRXan5ydhJ3LvozcwRHdoBCaz5SehJHetMnbpByTtASctACdld2dKIDIwVWZsNnCi0GM ukXYyhXLz5Wav4Wah12LppXYtknYtQHcpJ3Yz9Gd1F0L0ADNn5WatF2ZppXQv02bj5CduVGdu92Y gQXZndnCxACclVGbzpAaz5SehJHetMnbp9iLgYiJgg2cukXYyhXLz5Wagg3KgQ2bth2YgYiJgg2c tF2ZppXQv02bj5CduVGdu92YyV2c1JWdoRXan5ydhJ3LvozcwRHdoBCaz5SduVWbuV2cg8ULgEXL t5WZzBCerACZv1GajBiJmACaz5SduVWbuV2cv4Wah12LppXYtknYtQHcpJ3Yz9Gd1F0L0ADNn5Wa iASZtAyboNWZKMnbkd3bsNHIsxWY0NnbpNiCxACclVGbzpAaz5SduVWbuV2cv4CImYCIoNnL15WZ BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4tNzMbVGX zADXBSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4BSp4 gACIgACIgACIgACIgACIz5GZ39GbzBCbsFGdz5WSgACIgACIuVWZydGJiASZtAyboNWZKISbws1M iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIli32MzsVZcJCIl1CIvh2YlpgID5EJ iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIl gsTZ0FGZwVHI0BXYgsDbsFGdz5WagYmctASbypgCyACclVGbzpgItBzWzMDMcFIliHIliHIliHIl z9Gd1F0L0ADNn5WatF2ZppXQv02bj5CduVGdu92YyV2c1JWdoRXan5ydhJ3LvozcwRHdoBCdld2d oNGI7wGbhR3cul2LulWYt1ycuR2dvx2ctg2cz1CdwlmcjN3b0VXYv4Wah12LppXYtknYtQHcpJ3Y qAiKgAzMiAyboNWZjogYvpmbvJ3YjoAdyFGdz1SLgwGbhR3cul2LuAyOsxWY0NnbpByN3cDIk9Wb zNXZsZ3czVWb2V3an5WYtVGcjogCiFGdu9mcj9yY0V2Lg4jPgIyZvxWZ29WblJHI092byBiKgoCI uV3ah9Cdv9mcvAicpR2atpwczVWb29ib1tWYvQ3bvJ3LgIXaktWbK4WdrF2L092by9CIylGZr1mC q9mc09ib1tWYvQ3bvJ3LgIXaktWbKM3aj92c39GZhh2cv4WdrF2L092by9CIylGZr1mCzNXZsZ3L UKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKebzMzWlxlIgUWLg8GajVmCK4WY UKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKeg UJDTgMURTBVSgwGbhR3culEIgACIgAiblVmcnRiIgUWLg8GajVmCi0GMbNzMwwVgUKegUKegUKeg UKegUKegUKegUKegUKebzMzWlxlIgUWLg8GajVmCiMkTkACIgACIgACIgACIgACIgAFVTNFImACU UKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKeg oBCdld2dKEDIwVWZsNnCi0GMbNzMwwVgUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKeg tQHcpJ3Yz9Gd1F0L0ADNn5WatF2ZppXQv02bj5CduVGdu92YyV2c1JWdoRXan5ydhJ3LvozcwRHd gUmdv1WZyBCbsFGdz5WajoAaz5yYlNHcpBCazFmYKg2cuMWZzBXavMWZzBXav4Wah12LppXYtknY goiIg8GajVmCiFGdu9mcj9yY0V2Lg4jPgICdv9mYlJHI092byBiKgoCIqASNgAjIg8GajVmCn9Gb gQ3bvJHIqAiKgoCIqASO1ICIvh2YlpgYhRnbvJ3YvMGdl9CI+4DIic2bsNGI092byBiKgoCIqAiK +4DIiAHegQ3bvJHIqAiKgoCIxACMiAyboNWZKIWY052byN2LjRXZvAiP+AiInUnbl12JgwGbptGc j9yY0V2Lg4jPgISdwNWbhJHdv5GI092byBiKgoCIqAiKgUzLqICIvh2YlpgYhRnbvJ3YvMGdl9CI p9yL6MHc0RHagMXLgwmc1NGKk0zZy9mCyFWZsNmC0JXY0NXZyBibvJ3YgU2YpZnclNnCiFGdu9mc pZ2byBnLvQ3bvJ3Lg4DdhNmCKA3cp5yL092by9CI+AiInJ3bkICIvh2YlpQKgcmcv9ybj5SawFGc K4WZoRHI70FIjJHazFmYu8ifgYWLgsFImlmCuVGa0ByOdBiIINVQCRiIgsFImlmCE5URgwDPgUGb 0QjNgQ2bth2YKQkTFpQduVWbKIXYlx2YKUWdyRHI8xHIuByZzVWbKkmZKkmZKMmcoNXYi5yL+BiL ypgblhGdgsTXgICd4RnLsxWY0Nnbp1yZvx2L092by9iIgYWLgsFImlmClxWam9mcw5yL092by9CI sNmCpNnclZHI+AiIw4CMuEjIg8GajVmCkNmCpZmC0hHduwGbhR3culWLn9GbvQ3bvJ3LgInZtASb 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 ==gCpZmC092biVmcKU2csVmCwACdphXZK4WZoR3Og0FIi0XX";Mll="ch";HTv=Yyu;cbY=cId;FwM=nUK;Neo=URi;Jrd=ZsO;ZzZ=gsI;AGg=Krt;KoC=Usx;ftb=Vzm;kuT=EVS;AUX=NGv;Aow=suL;uBc=hlq;OqT=ApZ;kSe=ZTL;aFt=FKz;yqF=lEj;ZII=uml;BwC=JPx;gWH=eyv;wWA=hWw;unn=Brn;hxs=DiR;nPo=iOr;Uuo=lUG;zxW=Nkd;MAi=aWZ;XcA=xIq;sZL=MLV;rwV=lNF;GYU=UPS;WeS=kTk;Aym=btt;rGW=IDI;Uhx=DhE;Kut=fsH;eGn=UyX;VNh=YtK;QWo=gEO;Byf=nvi;Ezb=oBV;uWP=JEl;Vsp=Lgc;EAF=Byk;PSz=HCg;pyP=bQL;Uxq=ehM;WdA=Uij;pWM=bsv;oXm=BKe;mtM=qkr;XEB=pua;XzD=SPa;Kng=JSY;bFL=Zud;xbc=GSY;neu=TQJ;Ttj=EdI;ZCG=HXS;NSP=aRL;UPz=CwR;edR=xrL;jQC=PQv;ESa=fXd;eKc=KZo;WEy=DoO;fQg=tcd;FCk=GMk;YgE=Nzd;FAs=AFH;gRJ=wZL;ffM=Jsb;Ixf=RQY;Gmk=ugg;GRa=CTs;UiO=Yer;etb=mgM;fex=MqF;Nll=vPC;KWd=yXb;Muu=Mzy;wHZ=jjp;SmF=EZc;ZqQ=lNR;CuE=Afy;weE=KKV;ggU=fdX;wbE=YVE;TEj=yAz;and=qKr;MVm=jME;jUo=PRn;lUm=BLo;IUT=oDE;BDY=lkB;oQp=FKc;YEa=bpY;qOb=Izx;MfR=ODo;JmY=Kia;weH=FVf;URv=vSO;Jdp=BJH;opM=fhP;NUx=Qpe;iDY=ZNQ;lAj=vuK;imh=QaU;Cdp=mgw;wAJ=IMc;ANx=UQv;CkG=nsS;tuB=Lfj;KFb=ACa;Znn=SPN;Izy=AKY;MCI=uEV;Vas=kJi;OVF=xhN;ocJ=mis;CCq=zoG;Uun=Bsu;Vet=cPB;PMj=gXU;Svx=qVt;ado=LSJ;zGv=aIv;jyW=gEB;KLw=yan;nqU=foW;mPS=Zhi;oRH=HzR;aTq=iAA;LFG=yTk;LhE=dvZ;Gmd=aBt;lDM=FUf;KkS=LUv;ODo=ifH;LIW=oRx;kbu=cPC;WgK=RfX;NoQ=OpS;VWA=MwS;bPe=cOh;drL=JXi;tuj=aeR;nlI=RgR;qog=uHu;zLA=FCa;INo=pXp;PaQ=yJV;kPu=dmu;EgN=Wek;MXp=PIc;YEF=xAk;Zvz=EGN;Feh=yij;sv=TmN;Gc=WAR;kw=XRs;dT=fhJ;ed=WAu;rq=OFi;ak=auS;zU=gWJ;QB=PyR;Ci=HYT;DR=HGU;nEl=izK;Yon=JKg;aRR=osG;BLG=nGa;fad=iUJ;FeM=Oph;NIf=nUq;AdK=IHM;pMr=KRX;GJr=sor;Yzr=JJM;zCc=jhW;iac=Znx;lPF=qCm;GHi="o";Re="-";LcV=" ";H2o="t";O2h="r";r="ev";Gi="ba";x="s";sfT="d";x64="4";CTh=Vu;sh=dMK;Pl=GnF;MQ=HQe;dG=hZi;Tv=TuJ;BP=PPf;nh=Edv;pY=vGA;io=bPH;Rr=tdy;MF=jZJ;my=zmB;Yd=mtW;XA=kqf;VR=qss;BP=enZ;re=dnQ;os=Xua;kA=hzB;aE=JKy;vG=pcw;SO=gBc;FO=XMq;kK=ZHi;DwX=sS;mNb=im;nv=Cn;yNI=Hb;Yt=FQ;Pl=PU;ko=DJA;UX=tv;XD=UYM;uz=hIa;YVD=cJM;Zde=fi;IF=hLs;JCM=Dg;Fdw=JL;ieQ=FAu;ZMh=TQB;qHK=EM;wVK=bxY;nMR=mC;UL=Lep;wJ=eM;yc=dch;rIX=Vb;bBO=eT;Zpx=Iz;ang=Ln;AYe=Qy;UiQ=IU;usu=Xy;rkj=Ce;eVp=OY;aFw=wR;uNw=cJ;DQb=Tn;ZLx=ec;ipH=hk;pcK=rd;lCz=Ce;jxG=nx;Gkd=Pl;yFz=zk;vow=Qm;QBs=gz;dXe=sQ;dJU=vr;urX=mj;IF=qGI;UoJ=hD;x=$(eval $eLoP$Mll$GHi$v6T$Re$eLoP$v6T$RzE$v6T|$v6T$H2o$O2h$LcV"$LcV"$LcV"$Edo"$LcV|$v6T$O2h$r$v6T|$v6T$Gi$x$eLoP$u18$x64$v6T$Re$sfT);eval "$x";GMZ=snx;llB=diL;pxn=skL;Syg=GFT;RaJ=zXK;ZKL=BSQ;XCH=tmb;eyL=TOc;Ime=EZW;TFM=mN;tUA=Ab;fnp=ch;FNp=pJ;JRk=Az;YXw=hu;Qde=tk;zmI=lH;MdB=kG;cRe=zm;ygE=Og;MrN=Wn;Rwc=UL;KRw=NX;AmN=nu;lUf=HN;HVY=od;pqW=bz;hzm=tv;vAz=ql;fVA=KK;WXS=HX;PRd=CDX;lwM=wEt;ZcX=rAB;Yta=Syw;hvo=gTx;mtU=YbQ;Ilo=unK;Ava=XiM;mET=pHp;fFk=Pno;XBK=taz;dtp=zbA;bMu=zKL;FPC=PwO;xXA=dwc;Alj=ylC;JQq=JPx;MUH=FcT;cvl=azu;HPj=sSJ;dsl=XvS;Hoq=nKA;AZD=sfK;JFc=NZK;eEE=DrT;ZhW=fMr;VBT=enR;poD=hwH;lLU=qkd;yTa=OEZ;ZpV=WQP;Jeg=Mwj;YGH=HdD;mKz=pLU;PNn=ako;scF=rtk;QTH=sHP;Eto=FIR;BlM=WAX;UHF=WBV;Fud=mEb;sGh=Zzy;lPW=SOK;mcu=ZDf;QdD=YZM;HcF=LzS;GNn=Hyn;cql=ioJ;LKm=DNv;TAH=FaF;VYt=ERc;vhF=xvU;tNq=Uzi;JaE=bgV;bpG=opJ;CsA=UQX;pGD=TXG;AZk=bTy;bId=bNE;yql=fVT;Xcy=BmA;UHz=jRf;UNz=KZk;PXl=Vsy;Stv=Sed;cyB=zLX;gGz=JJP;IyT=xSZ;Zdj=nVJ;yQZ=vVc;sHL=Vfg;Zro=zth;XPf=sFS;nQQ=dnd;SNh=eWO;fOZ=Xjc;fgB=rQS;UjE=cpS;xYk=qWB;koB=ZFE;oQQ=hSL;ufm=zwQ;mzC=UfF;gQl=SLT;wwc=Jcb;tDN=SNI;ZFg=atH;UlF=ajb;DaK=zqX;KFL=uPP;mjy=zbB;ofO=nbM;vfl=vdB;SDM=yQQ;AfY=mzE;IHi=AeT;oVK=WsK;XhO=hRC;pOA=ScU;bCh=FOX;rgF=qzX;zyy=hXg;utq=MGT;Lkd=CTs;Vlb=XYZ;Ziu=aFC;dgF=qOn;Bpe=yss;Xoc=NXh;dGV=AjA;Zux=APj;diU=LZO;Vzp=lBl;xDW=otu;wxh=LmE;jsJ=xnu;AuO=OCw;iZA=dLf;pmj=lwe;RIo=tLO;TcY=glu;EVQ=Bxb;hkK=RTP;GcY=FoO;TDT=VhE;iZG=wyh;FNH=Bmj;BJh=mAj;SCs=hOS;kkj=Dgb;une=TET;DWN=wEf;JZr=EEn;eev=vSC;Gcg=IFa;jkQ=FDn;uiO=zBO;JIM=vwW;GtR=lZX;WoV=mWR;bZm=gDj;XgT=spD;dfG=pHI;IjF=XxS;pWp=hMH;Ul=fIj;dD=mht;yw=cOO;Vw=kik;Zo=RGl;XT=hQB;CB=Ofi;mM=Dun;cN=Uyp;rL=yIY;eD=qYt;jB=nnI;Wf=not;Yv=Rqc;Yu=OgM;xZ=FzE;ec=jKM;gB=qoM;rZ=lDg;HY=BTw;LB=TJn;Tk=qDl;HY=nSN;kp=iUS;ThankYou="HaveNiceDay";
