# -*- coding=utf-8 -*-
#!/bin/bash

"""
   Example: ./challenge.sh 22
"""
PORT=$1
# -w 强制完全匹配
PROCESS=`netstat -tunlp|grep -w ${PORT}`

if [[ -z $PROCESS ]];then
    echo "OFF" && exit 1
else
    SERVER_NAME=`echo "$PROCESS"|awk -F'/' '{print $2}'|uniq`
    if [[ -z ${SERVER_NAME} ]];then
        echo "Can't get the process name" && exit 1
    else
        which ${SERVER_NAME} && exit 1
    fi
fi
