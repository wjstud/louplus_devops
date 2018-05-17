#!/bin/bash

netstat -na | awk '/ESTABLISHED/{split($5,S,":");print S[1]}' \
            | sort | grep -v -E '192.168|127.0' | uniq -c | sort -rn \
            | awk '{if ($2!=null && $1>21) {print $2}}' \
            > /var/log/rejectip.txt

for i in $(cat /var/log/rejectip.txt)
do
    # 确认存不存在白名单内
    wirte_ip=$(cat /tmp/goodip | grep $i)
    # 确认存不存在 iptables 中
    ip_exist=$(iptabels-save | grep $i)
    if [[ -z ${wirte_ip} && -z ${ip_exist} ]] ;then
        # 都不存在就添加规则 一分钟只允许建立5次连接
        /sbin/iptables -A INPUT -s $i -m limit --limit 5/m -j ACCEPT
        echo "$i kill at $(date +%Y%m%d)" >> /var/log/ddos-ip.txt
    fi
done
