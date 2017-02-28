# -*- coding: utf-8 -*-
import requests
import codecs
from bs4 import BeautifulSoup

r = requests.get(url='https://m.baidu.com/from=1014571r/bd_page_type=1/ssid=0/uid=0/pu=usm%401%2Csz%40320_1001%2Cta%40iphone_2_6.0_3_534/baiduid=D0E36936B06145DA881186546E0DC78B/w=0_10_/t=iphone/l=3/tc?ref=www_iphone&lid=12811386804263672022&order=10&fm=alop&tj=www_normal_10_0_10_title&vit=osres&m=8&srd=1&cltj=cloud_title&asres=1&nt=wnor&title=%E4%B8%93%E8%AE%BF%E6%9D%8E%E6%9E%97%E9%94%8B%3A%E6%88%91%E4%B8%8ENetty%E9%82%A3%E4%BA%9B%E4%B8%8D%E5%BE%97%E4%B8%8D%E8%AF%B4%E7%9A%84%E4%BA%8B_%E7%B3%BB%E7%BB%9F%E6%9E%B6%E6%9E%84_%E9%85%B7%E5%8B%A4%E7%BD%91&dict=30&w_qd=IlPT2AEptyoA_yirGVOtEmCuEVFVnIW&sec=19116&di=bb849319fa652d74&bdenc=1&tch=124.43.285.1747.1.163&nsrc=IlPT2AEptyoA_yixCFOxXnANedT62v3IEQGG_yNFAz3595qshbWxBcNiVzz7RDrIBZOddTPOth51tXLR0GIk9Bl4wvQkfjS&eqid=b1cb306bbc4358001000000658b0207a&wd=&clk_info=%7B%22srcid%22%3A%221599%22%2C%22tplname%22%3A%22www_normal%22%2C%22t%22%3A1487937956323%2C%22xpath%22%3A%22div-div-div2-a-p%22%7D')  # 最基本的GET请求
print r.status_code  # 获取返回状态
soup = BeautifulSoup(r.content , "html.parser")
print soup.get_text()
f = codecs.open("hello.txt", "w", "utf-8")
li=soup.get_text()
f.write(li)
f.close()


