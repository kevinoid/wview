#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID="$(pidof -o %PPID /usr/bin/rpcbind)"
case "$1" in
  start)
    stat_busy "Starting rpcbind"
    [ -z "$PID" ] && /usr/bin/rpcbind &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      PID=$(pidof -o %PPID /usr/bin/rpcbind)
      echo $PID > /var/run/rpcbind.pid
      add_daemon rpcbind
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping rpcbind"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm /var/run/rpcbind.pid
      rm_daemon rpcbind
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0

