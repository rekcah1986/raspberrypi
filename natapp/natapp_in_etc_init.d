#!/bin/sh -e
### BEGIN INIT INFO
# Provides:          natapp.cn
# Required-Start:    $network $remote_fs $local_fs
# Required-Stop:     $network $remote_fs $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: autostartup of natapp for RaspberryPi
### END INIT INFO


NAME=natapp
DAEMON=/home/pi/Documents/raspberrypi/natapp/$NAME
PIDFILE=/var/run/$NAME.pid

[ -x "$DAEMON" ] || exit 0

case "$1" in
  start)
      if [ -f $PIDFILE ]; then
        echo -n "$NAME already running"
        echo "."
    else
        echo "Starting $NAME..."
	    start-stop-daemon -S -x $DAEMON -p $PIDFILE -m -b -o -q || return 2
        echo "."
    fi
    ;;
  stop)
            echo "Stoping $NAME..."
        start-stop-daemon -K -p $PIDFILE -s TERM -o -q || return 2
        rm -rf $PIDFILE
        echo "."
    ;;
  restart)
    $0 stop && sleep 2 && $0 start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
    ;;
esac
exit 0
