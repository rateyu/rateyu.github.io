#!/usr/bin/env bash
# shell 脚本 面试 大全 参考
today=`date --date='0 days ago' +%Y%m%d`
echo "$today"

for var in 10 20 ; do
    echo "$var"
    if [ ! -d /wind/ ]
    then 
       echo "no wind floder"
    fi

    if [ -d /root/ ]
    then 
        echo "has root floder"
    fi

done
