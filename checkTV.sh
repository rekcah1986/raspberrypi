# 加上sudo结果才能稳定
ESSID='ESSID:"DIRECT-D3-BRAVIA"' # TV wifi
tmp=$(sudo iwlist wlan0 scanning |grep $ESSID)
echo @$tmp@$ESSID@
if [[ $tmp =~ $ESSID ]]
then
    echo findout
else
    echo no
fi

