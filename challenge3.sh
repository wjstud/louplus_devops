#!/bin/bash

sudo mkdir ~/backup_big_log

# --parents 表示复制源目录结构
sudo find /var/log -type f -size +1M -exec cp --parents {} ~/backup_big_log \; 2> /dev/null

tar czf /tmp/backup_big_log.tar.gz ~/backup_big_log
