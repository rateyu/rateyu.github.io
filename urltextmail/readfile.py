# -*- coding: utf-8 -*-
import re

f = open("hello.txt","r")
lines = f.readlines()#读取全部内容

pattern = re.compile(r'[\w ]*')

zhPattern = re.compile(u'[\u4e00-\u9fa5]+')

for line in lines:
    match = zhPattern.search(line.decode('utf8'))
    # zhPattern = re.compile(u'[\u4e00-\u9fa5]+')
    if match:
        print '中文'+line
    # else:
    #     print '没有中文'+line

f.close()