#!/bin/sed -f

# 删除多余的空行
/^$/{
    N
    /\n$/{
    D
    }
}

# "[" 前面插入"!"
s/^\n\[/\n\!\[/