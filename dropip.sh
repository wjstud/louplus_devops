#!/bin/bash

netstat -na | awk '/ESTABLISHED/{split($5,S,":");print S[1]}' \
            | sort | grep -v -E '192.168|127.0' | uniq -c | sort -rn \
            | head -10 | awk '{if ($2!=null && $1>10) {print $2}}' \
            > /var/log/rejectip.txt

for i in $(cat /var/log/rejectip.txt)
do
    rep=$(/sbin/iptables-save | grep $i)
    if [[ -z $rep ]];then
        /sbin/iptables -A INPUT -s $i -j DROP
        echo "$i kill at $(date +%Y%m%d)" >> /var/log/ddos-ip.txt
    fi
done
