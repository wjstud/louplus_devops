#!/bin/bash

# mac bsd 版
sed -i "" "$ a\ 
MYNAME=wjstud
" ~/.zshrc

# linux gnu 版
sed -i '$ a\MYNAME=wjstud' ~/.zshrc
