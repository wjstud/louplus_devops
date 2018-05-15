#!/bin/bash

if [ $# -ne 1 ];     #如果输入的参数不为1个
then
    echo "Usage:$0 filename";
    exit -1
fi
filename=$1

egrep -o "\b[[:alpha:]]+\b" $filename | \
awk '
    {count[$0]++}
    END{
        printf("%-14s%s\n","word","count");
        for(ind in count)
        {
            printf("%-14s%d\n",ind,count[ind]);
        }
    }       
'
