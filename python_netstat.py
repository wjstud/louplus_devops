#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import glob

PROC_FILE = {
        'tcp': '/proc/net/tcp',
        'tcp6': '/proc/net/tcp6',
        'udp': '/proc/net/udp',
        'udp6': '/proc/net/udp6'
        }

STATUS = {
        '01': 'ESTABLISHED',
        '02': 'SYN_SENT',
        '03': 'SYN_RECV',
        '04': 'FIN_WAIT1',
        '05': 'FIN_WAIT2',
        '06': 'TIME_WAIT',
        '07': 'CLOSE',
        '08': 'CLOSE_WAIT',
        '09': 'LAST_ACK',
        '0A': 'LISTEN',
        '0B': 'CLOSING'
        }

def get_content(type):
    '''��ȡ�ļ�����'''
    with open(PROC_FILE[type], 'r') as f:
        content = f.readlines()
        content.pop(0) # ȥ�����µĵ�һ��̧ͷ
    return content

def get_program_name(pid):
    '''��ȡ������'''
    path = '/proc/' + str(pid) + '/comm'
    with open(path, 'r') as f:
        content = f.read()
    content = content.strip()
    return content

def convert_ip_port(ip_port):
    '''ת��'''
    ip, port = ip_port.split(':')
    port = int(port, 16)
    ip = [str(int(ip[6:8], 16)), str(int(ip[4:6], 16)),
          str(int(ip[2:4], 16)), str(int(ip[0:2], 16))]
    ip = '.'.join(ip)
    return ip, port

def get_pid(inode):
    for path in glob.glob('/proc/[0-9]*/fd/[0-9]*'):
        try:
            if str(inode) in os.readlink(path):
                return path.split('/')[2]
            else:
                continue
        except:
            pass
    return None

def main(choose):
    '''��ȡ�Լ�չʾ�˿����������Ϣ'''
    templ = "%-5s %-25s %-25s %-13s %-6s %s"
    print(templ % ("Proto", "Local address", "Remote address",
                   "Status", "PID", "Program name"))
    content = get_content(choose)
    #print(content)
    for info in content:
        iterms = info.split()
        proto = choose
        local_address = "%s:%s" % convert_ip_port(iterms[1])
        status = STATUS[iterms[3]]
        if status == 'LISTEN':
            remote_address = '-'
        else:
            remote_address = "%s:%s" % convert_ip_port(iterms[2])
        pid = get_pid(iterms[9])
        program_name = ''
        if pid:
            program_name = get_program_name(pid)
        print(templ % (proto, local_address, remote_address,
                       status, pid, program_name))

if __name__ == '__main__':
    choose = 'tcp'
    if len(sys.argv) > 1:
        choose = sys.argv[1]
    main(choose)
