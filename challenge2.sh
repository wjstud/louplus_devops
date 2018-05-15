#!/bin/bash

sudo groupadd shiyanlou
sudo groupadd test
sudo groupadd dev

# -m 自动创建家目录 —G 附属组
sudo useradd -m -d /home/jack - s /bin/bash -g shiyanlou -G test jack
sudo useradd -m -d /home/bob -s /bin/zsh -g shiyanlou -G dev bob
