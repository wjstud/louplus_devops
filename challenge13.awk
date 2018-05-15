#!/bin/awk -f

function Convert(count) {
    gb = 1024 * 1024 * 1024
    mb = 1024 * 1024
    kb = 1024
    if (count >= gb) {
        result = count / gb
        return int(result)" GB" # int 函数作用是去除小数
        }
    else if (count >= mb) {
        result = count / mb
        return int(result)" MB"
        }
    else {
        result = count / kb
        return int(result)" KB"
        }
    }

NR > 2 {
    num[$1] = $10
    }

END {
    for (i in num) {
        print("%-6s%6s\n",i,Convert(num[i]))
        }    
    }
