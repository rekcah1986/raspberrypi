cd "$( cd "$( dirname "$0"  )" && pwd )"
./checkTV.sh
ret=$?
if [[ $ret -eq 1 ]]
then
    python read.py "主人，您该休息了，，做个好梦"
else
    echo "主人好像已经睡了呢"
fi
