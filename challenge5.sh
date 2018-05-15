#!/bin/bash

mkdir ~/backup
# -g 指定快照文件
echo '0 3 * * * cd /home/shiyanlou/backup; sudo tar -g backinfo -czf $(date +\%Y-\%m-\%d).tar.gz /var/log 2>> error.log' >> tasks 
crontal tasks
rm tasks
