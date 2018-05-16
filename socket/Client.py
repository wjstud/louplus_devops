# -*- coding=utf-8 -*-

import socket
import time

HOST = '127.0.0.1'
PORT = 1234

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 参数是元组
s.connect((HOST, PORT))

while 1:
    # 把命令发送给对方端口
    s.sendall(b'this is python socket')
    # 把接受的数据定义为变量
    data = s.recv(1024)
    print(data)
    time.sleep(3)

s.close()
