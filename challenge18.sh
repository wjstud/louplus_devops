#!/bin/bash

se_status=$(getenforce)

if [[ ! ${se_status} == Enforcing ]];then
    echo "The selinux is not Enforcing. Now set Enforcing"
    sudo setenforce 1
    echo "OK"
fi

conf_status=$(cat /etc/selinux/config | grep -v "^#" | awk -F "=" '/SELINUX=/{print $2}')

if [[ ! ${conf_status} == enforcing ]];then
    echo "The selinux config is not enforcing, Now set enforcing"
    sudo sed -i "s/=${conf_status}/=enforcing/" /etc/selinux/config
    echo "OK"
fi

check_install=$(yum list installed | grep setroubleshoot)

if [[ -z ${check_install} ]];then
    echo "The setroubleshoot package is not install. Now installing"
    sudo yum install -y setroubleshoot-server > /dev/null
    echo "OK"
fi

echo "restart auditd"
sudo service auditd restart
echo "OK"

if ! ps -ef | grep -v grep | grep "rsyslogd";then
    echo "rsyslogd is stopd. Now start"
    sudo service rsyslogd start
    echo "OK"
fi

sudo mkdir /home/shiyanlou/website
sudo chown -R --reference=/var/www/html /home/shiyanlou/website
sudo chcon -R --reference=/var/www/html /home/shiyanlou/website

sudo touch /home/shiyanlou/config
sudo chcon -t httpd_sys_content_t /home/shiyanlou/config
