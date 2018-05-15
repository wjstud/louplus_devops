awk -v NUM=$1 -v TOPNUM=$2 '    #从终端获取参数
BEGIN{
    if(NUM<=0)    
        NUM=6      #当没有输入个数的时候，默认个数为 6
    if(TOPNUM<=0)
        TOPNUM=30  #默认范围的最大值为 30

    printf("between %d of %d\n",NUM,TOPNUM)

    for(i=1;i<=NUM;i++){   #用 for 循环生成 6 个随机数
        do{
            select=1+int(rand()*TOPNUM) #生成范围为 1~TOPNUM 范围的随机数
        }while(select in pick)  

        pick[select]=select   #每次生成的随机数插入一个数组，如果再次生成的数在数组中则丢弃，重新生成。
    }

    for(i in pick)     #遍历数组 pick
        printf("%s ",pick[i])  #打印出产生的随机数
    printf("\n")
}'

# 从终端获取两个参数，第一个参数是需要生成的个数，第二个参数是范围最大值。
