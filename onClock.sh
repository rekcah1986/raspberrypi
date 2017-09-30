cd "$( cd "$( dirname "$0"  )" && pwd )"
mpg123 -f 20000 -z --list clock.lst &
sleep 15m
python weather.py
