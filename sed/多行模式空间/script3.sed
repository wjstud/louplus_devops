运行 printf '%s\n' a1 a2 a3|sed -e '/1/bx;s/a/z/;:x;y/123/456/'
输入: a4
      z5
      z6

命令执行的流程是：

sed 读取第一行内容 a1
第一个命令是 /1/bx，寻址到包含 1 的内容会跳转到设置的 x 标签处
执行后续命令 y/123/456/，此时模式空间内容是 a1，其中 1 得到匹配，被替换成 4
第一行执行完毕
sed 读取第二行内容 a2
第一个命令是 /1/bx，此时是匹配不到 1，所以并不会跳转
第二个命令是 s/a/z/ 加匹配到的 a 替换成 z
第三个命令是 y/123/456/，此时模式空间内容是 z2，其中 2 得到匹配，被替换成 5
第二行执行完毕
第三行执行与第二行类似。
