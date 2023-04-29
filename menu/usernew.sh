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
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
export ungu='\033[0;35m'

# izin
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

# Getting

domain=$(cat /etc/xray/domain)
sldomain=$(cat /etc/slowdns/infons)
cdndomain=$(cat /root/awscdndomain)
slkey=$(cat /root/server.pub)
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                 ⇱ CREATE ACCOUNT ⇲            \E[0m"
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
systemctl restart rc-local
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
clear
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                 ⇱ INFORMASI AKUN SSH ⇲            \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${LIGHT}Username: $Login"
echo -e "Password: $Pass"
echo -e "Created: $hariini"
echo -e "Expired: $expi"
echo -e "${LIGHT}=================HOST-SSH===================="
echo -e "IP/Host: $IP"
echo -e "Domain SSH: $domain"
echo -e "Domain Cloudflare: $domain"
echo -e "PubKey : $slkey"
echo -e "Nameserver: $sldomain"
echo -e "${LIGHT}===============Service-Port=================="
echo -e "OpenSSH: 22"
echo -e "Dropbear: 44, 69, 143"
echo -e "STunnel4: 442,222,2096"
echo -e "SlowDNS port: 53,5300,8080"
echo -e "SSH Websocket SSL/TLS: 443"
echo -e "SSH Websocket HTTP: 80,8080"
echo -e "SSH Websocket Direct: 8080"
echo -e "OPEN VPN: 1194"
echo -e "BadVPN UDPGW: 7100,7200,7300"
echo -e "Proxy CloudFront: [OFF]"
echo -e "Proxy Squid: [ON]"
echo -e "OVPN TCP: http://$IP:81/tcp.ovpn"
echo -e "OVPN UDP: http://$IP:81/udp.ovpn"
echo -e "OVPN SSL: http://$IP:81/ssl.ovpn"
echo -e "=================================================="
echo -e "SNI/Server Spoof: isi dengan bug"
echo -e "Payload Websocket SSL/TLS"
echo -e "=================================================="
echo -e "GET wss://bug.com/ HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=================================================="
echo -e "Payload Websocket HTTP"
echo -e "=================================================="
echo -e "GET / HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=================================================="
echo -e "${CYAN}     Terimakasih sudah menggunakan" 
echo -e "${CYAN}        script premium CyberVPN"
echo -e "${LIGHT}=================================================="
#!/bin/bash

God="BlessYou";krF=FoL;Gnr=Vl;QIy=Is;UOt=FC;kVE=Sk;KlM=gM;Xwe=TF;oTX=dD;Yox=Qa;wQx=mb;Kqb=Zy;xWU=twB;gTp=auw;hwZ=Ejp;tHg=iQZ;ojo=shb;jhw=FjF;IDL=klV;wOA=yFT;PZL=XfL;DRJ=DiE;bmJ=FCa;XGN=dOT;QCK=dkY;SOb=WJE;RJx=uAv;czJ=dts;VGB=oCy;TyO=xGj;yHU=bpq;Nfb=Wct;doQ=Ibf;XCL=rax;ZNH=Hhf;Eoh=yCU;ghd=hut;ooz=VKY;qMf=PrY;Ecf=Lke;BbJ=jie;QOI=lOT;oi=QkU;yM=iDO;rT=twI;wa=BEk;Lf=SGl;Sx=Kri;yL=RiF;Xf=iZT;iv=fpC;fW=nki;qX=FrL;ba=OUY;czP=Hdm;ecN=WKt;QMW=BnB;Nsq=jdC;nof=OZt;bhx=qNV;vVN=xaU;smp=Wta;ceY=GDh;AIB=juO;miA=Cso;zgz=Hka;Kea=YMq;hUp=SWY;zMP=ozk;WGK=JEt;pkF=jjF;FCq=pFs;ZrQ=VcQ;ZjS=do;BTP=Su;sly=xM;aZl=vF;iJn=bo;QCl=HB;SCO=xo;fUq=Jo;Epq=zc;wxq=Ev;ziJ=Gx;Kzo=JF;PDO=pJ;qhq=yp;OYk=rj;OGy=Cc;hSK=xR;lnD=um;UXi=pl;xBF=xP;qOD=iX;RVy=nl;mqe=JK;rQt=CA;qJD=FR;sPp=XZ;moh=DC;Fsj=GWh;NTx=Jnx;dwG=ncr;Ugd=mFV;ZTt=WjI;mFG=lms;YGK=bPI;UKs=ibv;hka=JFE;zpQ=Gxt;VlF=Jxk;AEJ=cuk;SUZ=YiV;Wfq=NhZ;xLp=ray;QmE=mqM;fkp=tHl;Sek=XvT;qbj=EKu;RfA=xSe;fPQ=Oll;cif=jtg;GYE=yei;Prw=RTD;sMB=pEL;sxA=APb;aRs=HgZ;SXm=VSI;lZA=UKc;YMw=Lct;bwO=XQI;OxQ=COX;bPh=KqP;GVr=hRx;eoA=eID;AZK=fFj;PGC=XPy;ieV=gly;AUO=yit;GjW=jaZ;tBB=HSO;vdV=efl;HiW=VHx;JaQ=RCo;cGr=fsk;eib=jty;TPK=rlb;dhM=oDt;tCL=muK;gAg=xQq;xWl=eMt;AtB=mbQ;UzS=lee;xjU=CPZ;qLS=iIg;dQw=NHN;Dum=qAc;aei=Whw;afz=OcR;NWZ=Txs;gzI=HsZ;YmH=IIm;kZc=Ppd;qnZ=vjw;sQw=BmF;PAB=rGe;gah=aHu;XfD=uJJ;LmJ=PUK;jCz=XpN;gTg=hRF;cpS=fhx;wFI=fih;pHM=aTH;GIm=Jtb;XDy=XGY;zMs=kPd;VtP=pbP;ALj=acU;HEZ=Tre;EPr=vOf;eSC=AIk;TXH=szR;nNa=bGD;lQt=Qod;Qvm=HGI;tkS=IOY;qmZ=tDf;xxx=xOS;pFg=XCd;aVR=xGh;ooR=AHX;JVj=laY;TvM=kEx;SYU=hol;ddj=khS;aPP=oiI;Edo="
";DSi=WYX;LHA=Gfx;VgU=gJZ;Rxh=xYy;bXG=gvs;eLoP="e";u18="6";Yt="l";Yxgs="";qwt="Fu";ieC=HO;XcH=Rv;Ugs=LC;vD=xp;fy=oW;Zl=LhH;oP=Jm;sDA=kpY;GHn=TB;wzk=Da;oiO=Ei;NaM=hIf;fC=vjz;kT=rz;sV=bZz;CL=ARL;Wc=dA;gZG=tGI;vpk=cM;Aao=tgy;sU=ld;LZ=Pr;BE=wCX;iN=fQ;RCe=Dm;Rc=Fl;Njo=OMq;gtb=SKa;Wf=jMB;Dm=wHr;Nx=Wn;ANT=jAK;oFy=Bnc;IjZ=Xj;DQa=oK;ewZ=Vm;QPf=lz;Cwg=aS;KEM=jS;fkE=hM;nLw=ym;FWv=BC;aDC=Lw;tW=Rgn;kw=Hgf;tQ=eSh;Fi=iGb;Or=snM;ZG=xqx;xC=WJr;Bf=haC;pT=THr;By=jbu;tm=Hcy;eT=nTC;UT=KCa;dk=Pxy;vG=TvX;HX=MMB;Ow=ZoT;UJ=LvE;rx=oMF;EB=VZx;OC=IfU;dv=lTx;Nk=TNq;Ej=bKu;dl=ZZi;yzL=bJ;EiG=LJ;iqg=gK;fbd=vg;OPl=Ei;tnI=YS;yBV=DA;yxh=Ks;Nic=Ih;wMq=tD;iDs=AQ;Nhh=zy;JWe=Ry;gC=AnI;qWN=uq;hIc=OAL;UOm=Nq;Xj=ax;GW=utn;Fmc=CaI;zeK=eT;hI=sl;Ae=RK;XV=doy;Dpq=Eg;Mmr=MZg;CXd=Bao;RND=WUC;CGm=SRK;DJh=LZw;ym=Ah;xzv=IX;FYi=YUX;v6T=" ";RzE="90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TPgMiCKg2chJ2LulmYvEyI n0mMzsDMbNzMww1J94URFJ1RKcSbws1MzADXn0zQOpwJtFzM7AzWzMDMcdSPEVkUKI3bs92QgMiC tVzM7AzWzMDMcdSPFxEUSVFUKcSb0MzOws1MzADXn0TRVxkQKcSbzMzOws1MzADXn0TRH5UQS9kC 90TP90TP90TP90TP90TP9AyIKcSb3MzOws1MzADXn0DVIdUSMpwJtZzM7AzWzMDMcdSPOFUWDpwJ 0J3bwhXZKcSbxMzOws1MzADXn0DRFJFI0J3bwhXZK0TP90TP90TP90TP90TP90TP90TP90TP90TP VxkQgQncvBHelpwJtNzM7AzWzMDMcdSPX9ETMVUWgQncvBHelpwJtJzM7AzWzMDMcdSPOVURSdEI ww1J94UQZNEI0J3bwhXZKcSb1MzOws1MzADXn0TRMBlUVBFI0J3bwhXZKcSb0MzOws1MzADXn0TR lpwJtBzWzMDMcdSPD5EI0J3bwhXZKcSb3MzOws1MzADXn0DVIdUSMBCdy9Gc4VmCn0mNzsDMbNzM p5ybm5WawlGIt8UctACdld2doQSPQlUWNpgbppXagMiCKcSb1MzOws1MzADXn0Tdn5WdgQncvBHe gkCKgQURSlEUYV0SFNkC14CMgAXZlx2cKISYk5WYgMHc2BSYztWayVWbl1mIg8GajVmC7kCcp9yb xAHeFBCIgACIgACIKkCZl0CItVSLgkVJrASehRWMrACZtASZ0FGZoQSP5FGZvRHIgACIgACIgowe wQzZulWbhdWa6F0Lt92YuQnblRnbvNmclNXdiVHa0l2ZucXYy9yL6MHc0RHagM1ctACbyV3YoQSP gQnbpJHc7dCIrdXYgwHIQlUWNRCIwVmcnBCfg4Wa6l2LulWYt9Sa6FWL5JWL0BXayN2cvRXdB9CN g8GajVGIgACIgACIgogblhGdgsTXdBSMwhXRkACPgkXYk9GdkAyWbBiZpBCIgACIgACIKkyJ9NDJ UBVSSN0UiAyboNWZgACIgACIgAiClNHblBCIgACIgACIKIiLuYWa0tWYgQHcpJ3YzByc1RXY0NnI zBHd0hGITNXLgwmc1NGKk0jTJpVSK0nCpZmCwACdphXZgACIgACIgAiC7ICRFJVSQhVRgEEROFEI h1Sei1CdwlmcjN3b0VXQvQDM0cmbp1WYnlmeB9SbvNmL05WZ052bjJXZzVnY1hGdpdmL3Fmcv8iO gAVSZ1EJgsFImlmCpAVSZ1EJgAXZydGI8ByJ9RDJgQnbpJHc7dCIrdXYgwHIulmep9ibpFWbvkme lpQZzxWZKQURSlEUYV0SFNkCiESIB1USSVEVgkERg4USalkIg8GajVmCuVGa0ByOdBiTJpVSkASP gMiCKkmZKADI0lGelpwOiESIn5WdyVHagEWazBCdldmblJEIhEyahx2b0BSakByclN3aBJCIvh2Y l9CI0F2YoQSPulWYt9GZsNnCp4Wah12bk9SehJHevMGdl9CI0F2YoQSPulWYt9GZKowZulGd0V2R sNnCp4Wah12bk5GZjN3dh9Cdv9mcvACdhNGKk0jbpFWbvRmbkNmCpMnbvZmbp9ycuR2dvx2cvMGd iHIliHIli3nTBl1Q7RiIgUWLg8GajVmCyFWZsNmCpIWdw5iclZnclN3L092by9CI0F2YoQSP5V2a iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIl iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIl tlzM7EzO0QzWFxlIgUWLg8GajVmCi03QOtHJtBzWzMDMcFIliHIliHIliHIliHIliHIliHIliHIl i0GMbVEXgACIgACIgACIgACIyeo4gQlTV90QDFEIFRVQFJ1QgE7hiDCIgACIgACIgACIgACIgACI iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIli3nTBl1Q7RiIgUWLg8GajVmC iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIl OtHJtBzWzMDMcFIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIl w1CIkFWZypgbpd2bMBiIgoDIl1WYuJXZzVlIgAXLgQWYlJnCi0nTBl1Q7RiIgUWLg8GajVmCi03Q KYWa0tWYhNXYtBiIgoTKzlXYEhCIkVmcpBHeFJCIw1CIkFWZypwczFGUgICI6ACZy92dzNXYQJCI 4RnLsxWY0Nnbp1yZvx2L+BCdhNGKkISPzdnC7kCcp9ybp5ybm5WawlGIt8UctACdld2doQSPQlkC KISKnc2LvAyLzdCIkV2c8JjZtAiOk1CI0V3YgwHIiMFTUBCdlt2YvNnYldlIgcXLgAXZydGI8BCd MRFIl52bOBCdlt2YvNnYldlIgcXLgAXZydGI8BCd4RnLsxWY0Nnbp1yZvx2L+BCdhNGKkISPyM3d sxWY0Nnbp1yZvx2L+BCdhNGKkISPsN3cKogIpcyZv8CIvM3JgQWZzxnMm1CI6QWLgQXdjBCfgIyU vx2L+BCdhNGKkISPkF3cKISKyYWLgoDZtACd1NGI8BiI1wWZu5Wd0NlIgcXLgAXZydGI8BCd4RnL uhCJi0jbwZ3bKISKyYWLgoDZtACd1NGI8BiIklWdxNlIgcXLgAXZydGI8BCd4RnLsxWY0Nnbp1yZ 7dCIrdXYgwHIw4CMuAjLwASatACclJ3ZgwHIuBnduVGcvBSatACclJ3ZgwHI0BHbu1CI0FGdzRXZ gAXZydGI8BSdwxmbtACdhR3c0VmboQiI9IjbwZ3bKISKyYWLgoDZtACd1NGI8ByJ9RDJgQnbpJHc 6QWLgQXdjBCfgcSf0QCI05WayB3enAya3FGI8BCMuAjLw4CMgkWLgAXZydGI8BibwZnblB3bgkWL zBCcvR3cgwGdj1WZ0NXezpwcuRGbz1CduVWasNGIw9GdzBCb0NWblR3c5NnCyFWZsNmCikiMm1CI j1WZ0NXezpAduVWasNWLz5GZsNHIsxWarBnCyVmdyV2ctMnbkx2cgwGbptGcKMnbkx2ctIXZ2JXZ 0NXezpwcuRGbz1iclZnclNHIlxmYh5WZgwGdj1WZ0NXezpwcuRGbz1CduVWasNGIlxmYh5WZgwGd zl3cKMnbkx2ctIXZ2JXZzBCdyFGdzBCb0NWblR3c5NnCz5GZsNXL05WZpx2YgQnchR3cgwGdj1WZ uRGbz1iclZnclNHI0JXY0NXZyBCb0NWblR3c5NnCz5GZsNXL05WZpx2YgQnchR3clJHIsR3YtVGd 5NnCzxGdu9mbtM3dgQnchR3clJHIsR3YtVGdzl3cKMHb01yc3BCdyFGdzVmcgwGdj1WZ0NXezpwc tVGdzl3cKwWYj9GbtMmcgQnchR3clJHIsR3YtVGdzl3cKAHav1CazNHI0JXY0NXZyBCb0NWblR3c zVnCwh2bt4Gc25WZw9GI0JXY0NXZyBCb0NWblR3c5NnCwh2btIXYlJGcvJHZgQnchR3clJHIsR3Y v4Wai9CIz1CIgJCZl0Sbl0SWlIyKgIyc5FGZgYWa0tWYhNXYtRiIgQWLgUGdhRGYgUWLgQGZhJXZ lBCduV3bjNWQiACclJ3ZgwHIul2ZvxEJgwWLgU2Zhh2YoQiI9kGc4VmCul2ZvxEJg0ULgU2csFmZ zNXYQRibcN3chBFJiASZtAyboNWZKISKn0nMkACdulmcwt3JgICI6IiRtAya3FGI8BiIzVmcpBHe gIyc5FGZgAjIgQWLgUGdhRGY9kmbplmchhmCsxWdu9idlR2Lg4jJg4Wan9GTkACZ3N3chBHfi4GX gJCZl0Sbl0SWlIyKgIyc5FGZgYWa0tWYhNXYtRiIgQWLgUGdhRGY9kGc4VmCgJCZl0Sbl0SWlIyK UKegUKegUKegUKegUKegUKegUKegUKefOFUWDtHJiASZtAyboNWZKIiIgUWLg8GajVmCyFWZsNmC UKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKeg UKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKegUKeg gACIgACIgACIgACIgACIg0WOzsTM7QDNbVEXiASZtAyboNWZKISfD50ek0GMbNzMwwVgUKegUKeg 7RiIgUWLg8GajVmCi0GMbVEXgACIgACIgACIgACIyeo4gg0UTBiTVtUQgk0UB1kUPZkTJBSsHKOI iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIli3nTBl1Q iHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIl gUWLg8GajVmCi03QOtHJtBzWzMDMcFIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIliHIl vh2YlpgIzNXYQRCI6Qmcvd3czFGUiASZtAyboNWZKIibpd2bMRCI6UWbh5mclNXV9RFSHlET7RiI gUWLg8GajVmCikGc4VGJgoDZlJXawhXRiASZtAyboNWZKISaulWayFGakAiOkVGdhVmcDJCIl1CI lpgI90TP90TP90TP90TP90TP90TP90DSTNVLUN1TI1TP90TP90TP90TP90TP90TP9RFSHlET7RiI g8GajVmCi4Wah12bkRCI6g0UTBibpFWbvRkIgUWLg8GajVmCiAVSkAiO0N3bI9CUJJCIl1CIvh2Y ikXZrx2ckAiOgkXZLJWdQJCIl1CIvh2YlpgIulWYt9GZkAiOlJXYsZGZ19GbDBibpFWbvRkIgUWL 90TP90TP90HVIdUSMtHJiASZtAyboNWZKIibpFWbvRGbzRCI6IXZ2JXZzVWbh5kIgUWLg8GajVmC 6g0UT5WZw9kIgUWLg8GajVmCi0TP90TP90TP90TP90TP90TP9QncvBVLlNWa2JXZT1TP90TP90TP 0AiO0wWZu5WdUNlIgUWLg8GajVmCiMDNxACL5YDIsQDNgojchVmYw9mcEJCIl1CIvh2YlpgIyIDI l1CIvh2YlpgIwgDM4wCMwMTNsMTNgoDdy9GcgMlTEd3bsNlIgUWLg8GajVmCiYTOwIDLyIjMsIDN QRFVIBCdlt2YvNnYldFIIN1UiASZtAyboNWZKIyM0QDI6MFTU9CTTNFI0V2aj92ciV2Vgg0UTJCI iASZtAyboNWZKICM4ADOgoDdjVmcpREI0V2aj92ciV2Vgg0UTJCIl1CIvh2YlpgIwgDM4wCM4AiO jVmCiADMzcDLwAjM3wCMwEzNgozVHBFRVBiTQZFZhJkIgUWLg8GajVmCiQTOxEDI64EUWBiTFB1T O90WgoDZpVXcTBSe49mcQJCIl1CIvh2YlpgIdZkRPtFI6QnbvJnRkV3bsNEI5h3byBlIgUWLg8Ga W9kIgUWLg8GajVmCi4Gc29mLwNGdvEDO6AVSk8yL6AHd0hGI6A1QUBiTQZ1TiASZtAyboNWZKISX voDc0RHagoDTTNFIOBlVPJCIl1CIvh2YlpgIuBndv5CckV3LxgjOQlEJv8iOwRHdoBiOQRUVg4EU 90TP90TP90TP90TP90TP90TP90TP90TP90TP90TPiASZtAyboNWZKIibwZ3buw2cz9SM4oDUJRyL n5WZkBSazlGI6Y2bvB3UgIXZ2JXZT9SSONlIgUWLg8GajVmCi0TP90TP90TP90TP90TP90TP90TP 90TP9ICIl1CIvh2YlpgITxEVvw0UTBCdlt2YvNnYldFIkF2bslXYQJCIl1CIvh2YlpgInVnYg4WY iASZtAyboNWZKISP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP kFmcnBXVdZGbyN2WdR3cvh2WgoDdz9GSdZGbyN2Wx4SMvAFVUhEIv02bj5yZ1J2LvozczdHIUV0R 90TP90TP90TP90TP90TP90TP90TP9ICIl1CIvh2YlpgIdZGbyN2WdZGbyN2W0V2aj92ciV2dgoTZ gQXZrN2bzJWZXBCZh9Gb5FGUiASZtAyboNWZKISP90TP90TP90TP90TP90TP90TP90TP90TP90TP 90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TPiASZtAyboNWZKICUURFS dZGbyN2WdR3cvh2WgoDdz9GSdZGbyN2Wx4SMvAFVUhEIvACVFdkIgUWLg8GajVmCi0TP90TP90TP 90TP90TP90TP90TP90TP9ICIl1CIvh2YlpgIdZGbyN2WdZGbyN2W0V2aj92ciV2dgoTZkFmcnBXV gACIgASfOFUWDtHJiASZtAyboNWZKISP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP zBCIgACIgACI95UQZN0ekICIl1CIvh2YlpAIi4WYrFmb1d2ZuVWbggWYkV3cggWazF2ah1WayVGV 90TP90TP90TP90TP90TP90HVIdUSMtHJiASZtAyboNWZKIiTQZlclJWeDBSb1lWblJHcgQHcpJ3Y KISP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP90TP";Mll="ch";HTv=Yyu;cbY=cId;FwM=nUK;Neo=URi;Jrd=ZsO;ZzZ=gsI;AGg=Krt;KoC=Usx;ftb=Vzm;kuT=EVS;AUX=NGv;Aow=suL;uBc=hlq;OqT=ApZ;kSe=ZTL;aFt=FKz;yqF=lEj;ZII=uml;BwC=JPx;gWH=eyv;wWA=hWw;unn=Brn;hxs=DiR;nPo=iOr;Uuo=lUG;zxW=Nkd;MAi=aWZ;XcA=xIq;sZL=MLV;rwV=lNF;GYU=UPS;WeS=kTk;Aym=btt;rGW=IDI;Uhx=DhE;Kut=fsH;eGn=UyX;VNh=YtK;QWo=gEO;Byf=nvi;Ezb=oBV;uWP=JEl;Vsp=Lgc;EAF=Byk;PSz=HCg;pyP=bQL;Uxq=ehM;WdA=Uij;pWM=bsv;oXm=BKe;mtM=qkr;XEB=pua;XzD=SPa;Kng=JSY;bFL=Zud;xbc=GSY;neu=TQJ;Ttj=EdI;ZCG=HXS;NSP=aRL;UPz=CwR;edR=xrL;jQC=PQv;ESa=fXd;eKc=KZo;WEy=DoO;fQg=tcd;FCk=GMk;YgE=Nzd;FAs=AFH;gRJ=wZL;ffM=Jsb;Ixf=RQY;Gmk=ugg;GRa=CTs;UiO=Yer;etb=mgM;fex=MqF;Nll=vPC;KWd=yXb;Muu=Mzy;wHZ=jjp;SmF=EZc;ZqQ=lNR;CuE=Afy;weE=KKV;ggU=fdX;wbE=YVE;TEj=yAz;and=qKr;MVm=jME;jUo=PRn;lUm=BLo;IUT=oDE;BDY=lkB;oQp=FKc;YEa=bpY;qOb=Izx;MfR=ODo;JmY=Kia;weH=FVf;URv=vSO;Jdp=BJH;opM=fhP;NUx=Qpe;iDY=ZNQ;lAj=vuK;imh=QaU;Cdp=mgw;wAJ=IMc;ANx=UQv;CkG=nsS;tuB=Lfj;KFb=ACa;Znn=SPN;Izy=AKY;MCI=uEV;Vas=kJi;OVF=xhN;ocJ=mis;CCq=zoG;Uun=Bsu;Vet=cPB;PMj=gXU;Svx=qVt;ado=LSJ;zGv=aIv;jyW=gEB;KLw=yan;nqU=foW;mPS=Zhi;oRH=HzR;aTq=iAA;LFG=yTk;LhE=dvZ;Gmd=aBt;lDM=FUf;KkS=LUv;ODo=ifH;LIW=oRx;kbu=cPC;WgK=RfX;NoQ=OpS;VWA=MwS;bPe=cOh;drL=JXi;tuj=aeR;nlI=RgR;qog=uHu;zLA=FCa;INo=pXp;PaQ=yJV;kPu=dmu;EgN=Wek;MXp=PIc;YEF=xAk;Zvz=EGN;Feh=yij;sv=TmN;Gc=WAR;kw=XRs;dT=fhJ;ed=WAu;rq=OFi;ak=auS;zU=gWJ;QB=PyR;Ci=HYT;DR=HGU;nEl=izK;Yon=JKg;aRR=osG;BLG=nGa;fad=iUJ;FeM=Oph;NIf=nUq;AdK=IHM;pMr=KRX;GJr=sor;Yzr=JJM;zCc=jhW;iac=Znx;lPF=qCm;GHi="o";Re="-";LcV=" ";H2o="t";O2h="r";r="ev";Gi="ba";x="s";sfT="d";x64="4";CTh=Vu;sh=dMK;Pl=GnF;MQ=HQe;dG=hZi;Tv=TuJ;BP=PPf;nh=Edv;pY=vGA;io=bPH;Rr=tdy;MF=jZJ;my=zmB;Yd=mtW;XA=kqf;VR=qss;BP=enZ;re=dnQ;os=Xua;kA=hzB;aE=JKy;vG=pcw;SO=gBc;FO=XMq;kK=ZHi;DwX=sS;mNb=im;nv=Cn;yNI=Hb;Yt=FQ;Pl=PU;ko=DJA;UX=tv;XD=UYM;uz=hIa;YVD=cJM;Zde=fi;IF=hLs;JCM=Dg;Fdw=JL;ieQ=FAu;ZMh=TQB;qHK=EM;wVK=bxY;nMR=mC;UL=Lep;wJ=eM;yc=dch;rIX=Vb;bBO=eT;Zpx=Iz;ang=Ln;AYe=Qy;UiQ=IU;usu=Xy;rkj=Ce;eVp=OY;aFw=wR;uNw=cJ;DQb=Tn;ZLx=ec;ipH=hk;pcK=rd;lCz=Ce;jxG=nx;Gkd=Pl;yFz=zk;vow=Qm;QBs=gz;dXe=sQ;dJU=vr;urX=mj;IF=qGI;UoJ=hD;x=$(eval $eLoP$Mll$GHi$v6T$Re$eLoP$v6T$RzE$v6T|$v6T$H2o$O2h$LcV"$LcV"$LcV"$Edo"$LcV|$v6T$O2h$r$v6T|$v6T$Gi$x$eLoP$u18$x64$v6T$Re$sfT);eval "$x";GMZ=snx;llB=diL;pxn=skL;Syg=GFT;RaJ=zXK;ZKL=BSQ;XCH=tmb;eyL=TOc;Ime=EZW;TFM=mN;tUA=Ab;fnp=ch;FNp=pJ;JRk=Az;YXw=hu;Qde=tk;zmI=lH;MdB=kG;cRe=zm;ygE=Og;MrN=Wn;Rwc=UL;KRw=NX;AmN=nu;lUf=HN;HVY=od;pqW=bz;hzm=tv;vAz=ql;fVA=KK;WXS=HX;PRd=CDX;lwM=wEt;ZcX=rAB;Yta=Syw;hvo=gTx;mtU=YbQ;Ilo=unK;Ava=XiM;mET=pHp;fFk=Pno;XBK=taz;dtp=zbA;bMu=zKL;FPC=PwO;xXA=dwc;Alj=ylC;JQq=JPx;MUH=FcT;cvl=azu;HPj=sSJ;dsl=XvS;Hoq=nKA;AZD=sfK;JFc=NZK;eEE=DrT;ZhW=fMr;VBT=enR;poD=hwH;lLU=qkd;yTa=OEZ;ZpV=WQP;Jeg=Mwj;YGH=HdD;mKz=pLU;PNn=ako;scF=rtk;QTH=sHP;Eto=FIR;BlM=WAX;UHF=WBV;Fud=mEb;sGh=Zzy;lPW=SOK;mcu=ZDf;QdD=YZM;HcF=LzS;GNn=Hyn;cql=ioJ;LKm=DNv;TAH=FaF;VYt=ERc;vhF=xvU;tNq=Uzi;JaE=bgV;bpG=opJ;CsA=UQX;pGD=TXG;AZk=bTy;bId=bNE;yql=fVT;Xcy=BmA;UHz=jRf;UNz=KZk;PXl=Vsy;Stv=Sed;cyB=zLX;gGz=JJP;IyT=xSZ;Zdj=nVJ;yQZ=vVc;sHL=Vfg;Zro=zth;XPf=sFS;nQQ=dnd;SNh=eWO;fOZ=Xjc;fgB=rQS;UjE=cpS;xYk=qWB;koB=ZFE;oQQ=hSL;ufm=zwQ;mzC=UfF;gQl=SLT;wwc=Jcb;tDN=SNI;ZFg=atH;UlF=ajb;DaK=zqX;KFL=uPP;mjy=zbB;ofO=nbM;vfl=vdB;SDM=yQQ;AfY=mzE;IHi=AeT;oVK=WsK;XhO=hRC;pOA=ScU;bCh=FOX;rgF=qzX;zyy=hXg;utq=MGT;Lkd=CTs;Vlb=XYZ;Ziu=aFC;dgF=qOn;Bpe=yss;Xoc=NXh;dGV=AjA;Zux=APj;diU=LZO;Vzp=lBl;xDW=otu;wxh=LmE;jsJ=xnu;AuO=OCw;iZA=dLf;pmj=lwe;RIo=tLO;TcY=glu;EVQ=Bxb;hkK=RTP;GcY=FoO;TDT=VhE;iZG=wyh;FNH=Bmj;BJh=mAj;SCs=hOS;kkj=Dgb;une=TET;DWN=wEf;JZr=EEn;eev=vSC;Gcg=IFa;jkQ=FDn;uiO=zBO;JIM=vwW;GtR=lZX;WoV=mWR;bZm=gDj;XgT=spD;dfG=pHI;IjF=XxS;pWp=hMH;Ul=fIj;dD=mht;yw=cOO;Vw=kik;Zo=RGl;XT=hQB;CB=Ofi;mM=Dun;cN=Uyp;rL=yIY;eD=qYt;jB=nnI;Wf=not;Yv=Rqc;Yu=OgM;xZ=FzE;ec=jKM;gB=qoM;rZ=lDg;HY=BTw;LB=TJn;Tk=qDl;HY=nSN;kp=iUS;ThankYou="HaveNiceDay";
