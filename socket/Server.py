# -*- coding=utf-8 -*-

import socket

HOST = '127.0.0.1'
PORT = 1234

# ���� socket ����, ����ͨ��, TCP
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# ������Ԫ��
s.bind((HOST, PORT))
s.listen(1)

while 1:
    # ���� TCP ����, �������µ� socket �� IP ��ַ
    conn, addr = s.accept()
    # ����ͻ��˵� IP ��ַ
    print('Connected by', addr)
    while 1:
        # �ѽ��յ�����ʵ����
        data = conn.recv(100)
        print(data)
        conn.sendall(data)
conn.close()
