#! /bin/sh

HOME=/home/pi
DOSENET=$HOME/dosenet-raspberrypi

LOG=/tmp/AQ_manager.log

case "$1" in
  start)
    echo "Starting Air Quality Sensor script" > $LOG
    sleep 30
    sudo -E python $DOSENET/managers.py --sensor 3 --log --logfile $LOG >>$LOG 2>&1
    echo "Finished Air Quality Sensor script" >> $LOG
    ;;
  test)
    echo "Starting Air Quality Sensor script in test mode" > $LOG
    sudo -E python $DOSENET/managers.py --sensor 3 --sender-mode tcp_test --interval 30 --log --logfile $LOG >> $LOG 2>&1
    ;;
  stop)
    echo "Stopping Air Quality Sensor script" >> $LOG
    sudo pkill -SIGQUIT -f managers.py
    ;;
 *)
    echo "Usage: /home/pi/dosenet-raspberrypi/AQ.sh {start|test|stop}"
    exit 1
    ;;
esac

exit 0
