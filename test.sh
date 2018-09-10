#!/bin/sh

# 111111111
result=`ls / |wc -l`

while [ 1 -eq 1 ]
do
echo "resl===$result"
# 222222222
if [ "26" = $result ];then
    echo "111"
    break
else
    echo "000"
fi
echo "sleep"
sleep 5
# 333333333333
result=$(ls / |wc -l)
done
