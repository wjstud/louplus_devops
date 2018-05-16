# -*- coding=utf-8 -*-

import socket

HOST = '127.0.0.1'
PORT = 1234

# 定义 socket 类型, 网络通信, TCP
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 参数是元组
s.bind((HOST, PORT))
s.listen(1)

while 1:
    # 接受 TCP 连接, 并返回新的 socket 与 IP 地址
    conn, addr = s.accept()
    # 输出客户端的 IP 地址
    print('Connected by', addr)
    while 1:
        # 把接收的数据实例化
        data = conn.recv(100)
        print(data)
        conn.sendall(data)
conn.close()
