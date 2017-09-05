# 加上sudo结果才能稳定
ESSID='ESSID:"DIRECT-D3-BRAVIA"' # TV wifi
#ESSID='ESSID:"WD"'
tmp=$(sudo iwlist wlan0 scanning |grep $ESSID)
if [[ $tmp =~ $ESSID ]]
then
    echo findout
    exit 1
else
    echo no
    exit 0
fi

