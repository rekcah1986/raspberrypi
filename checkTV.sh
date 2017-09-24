# 加上sudo结果才能稳定
ESSID='ESSID:"DIRECT-JU-BRAVIA"' # TV wifi
#ESSID='ESSID:"WD"'
tmp=$(sudo iwlist wlan1 scanning |grep $ESSID)
if test ${#tmp} -eq 0 
then
    echo 'tv off'
    exit 1
else
    echo 'tv on'
    exit 0
fi

