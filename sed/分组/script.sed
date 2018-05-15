#!/bin/sed -f

/b/{
    /hello/s/world/shiyanlou/
# d 后面必须有空格 如果没有空格的话，所有含有 b 字符的行的字符 world 都会被替换成 louplus。因为 sed 会把 d 认成一个特殊字符
    /d /s/world/louplus/
}
