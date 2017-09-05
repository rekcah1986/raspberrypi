# 加上sudo结果才能稳定
#ESSID='ESSID:"DIRECT-D3-BRAVIA"' # TV wifi
ESSID='ESSID:"WD"'
tmp=$(sudo iwlist wlan0 scanning |grep $ESSID)
if [[ $tmp =~ $ESSID ]]
then
    exit 1
else
    exit 0
fi

