#!/bin/bash
lsb_functions="/lib/lsb/init-functions"
if test -f $lsb_functions ; then
  . $lsb_functions
else
  log_success_msg()
  {
    echo " SUCCESS! $@"
  }
  log_failure_msg()
  {
    echo " ERROR! $@"
  }
fi

PORT=$1
INITDIR=/home/q/garb/multi/$PORT
if [ $# -ne 1 ];then
    log_failure_msg "Usage: $0 port"
    exit
fi

if [ -d $INITDIR ];then
    log_failure_msg "the dir is exist" 
else
    mkdir -p $INITDIR
cat > $INITDIR/garbd.cnf <<EOF
#address=gcomm://10.86.212.207:4106,192.168.254.162:4106,192.168.53.109:4106
#group=pxc_intern
EOF
log_success_msg "init ok"
fi
