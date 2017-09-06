cd "$( cd "$( dirname "$0"  )" && pwd )"

TIPS[0]="主人，已经很晚了，您该休息了"
TIPS[1]="主人，熬夜对身体不好"
TIPS[2]="早睡早起身体好"
TIPS[3]="你不听话是不是？"
TIPS[4]="再不睡觉，老妖怪就来抓你啦"
TIPS[5]="关上电视机去睡觉吧"
TIPS[6]="你怎么还不去睡觉？"
TIPS[7]="我说话你听不到吗？"
TIPS[8]="你爱特么睡不睡，反正我要睡了"

function getTip()
{
	tip=0
    if [ $1 == 0 ]; then
        tip=0
    elif [ $1 == 8 ]; then
		tip=8
    else
		tip=$(($RANDOM%7))
		let tip=tip+1
	fi
	#RET=${TIPS[$tip]}
	return $tip
}

for ((i=0;i<=8;i++))
do
    ./checkTV.sh
    ret=$?
    if [[ $ret -eq 1 ]]
    then
		getTip $i
		msg=${TIPS[$?]}
        python read.py $msg &
        sleep 600
    else
        echo "电视没开着"
        break
    fi
done
