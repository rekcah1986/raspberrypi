cd "$( cd "$( dirname "$0"  )" && pwd )"
lua ./checkTV.lua
ret=$?
if [[ $ret -eq 1 ]]
then
	echo "TV ON"
else
	mpg123 -f 20000 -z --list clock.lst &
fi
sleep 2m
python weather.py
