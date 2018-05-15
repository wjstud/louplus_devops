#!/bin/awk -f

"""
$ seq 6 | awk '{getline;print $0}'
输出: 2 
      4
      6

$ seq 6 | awk '{print $0;getline}'
输出: 1
      3
      5
"""
# getline 函数
BEGIN { getline; }
{
    num[$1]++
}

END {
    for (i in num) {
        printf("%d %s\n", num[i], i) | "sort -n -k1"
    }
}
