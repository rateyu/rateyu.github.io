# -*- coding: utf-8 -*-
# 输入Email地址和口令:
# from_addr = raw_input('From: ')
# password = raw_input('Password: ')
# 输入SMTP服务器地址:
# smtp_server = raw_input('SMTP server: ')
# 输入收件人地址:
# to_addr = raw_input('To: ')
from email import encoders
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart

from_addr = 'y81212@163.com'
to_addr = 'y81212@163.com'
password = ''
smtp_server = 'smtp.163.com'

from email.mime.text import MIMEText
import smtplib
#server = smtplib.SMTP(smtp_server, 25) # SMTP协议默认端口是25
server = smtplib.SMTP()
server.connect('smtp.163.com')
server.ehlo()
server.starttls()
server.ehlo()

server.set_debuglevel(1)
server.login(from_addr, password)

msg = MIMEMultipart()

msg['Subject'] = 'Python mail Test'
msg['From'] = from_addr
msg['To'] = to_addr


# 添加附件就是加上一个MIMEBase，从本地读取一个图片:
with open('hello.txt', 'rb') as f:
    # 设置附件的MIME和文件名，这里是png类型:
    mime = MIMEBase('txt', 'txt', feilename='hello.txt')
    # 加上必要的头信息:
    mime.add_header('Content-Disposition', 'attachment', filename='hello.txt')
    mime.add_header('Content-ID', '<0>')
    mime.add_header('X-Attachment-Id', '0')
    # 把附件的内容读进来:
    mime.set_payload(f.read())
    # 用Base64编码:
    encoders.encode_base64(mime)
    # 添加到MIMEMultipart:
    msg.attach(mime)

# 邮件正文是MIMEText:
msg.attach(MIMEText('send with file...邮件正文', 'plain', 'utf-8'))
# puretext = MIMEText('hello,world 我是纯文本部分，')
# msg.attach(puretext)

server.sendmail(from_addr, [to_addr], msg.as_string())
# server.sendmail(from_addr, [to_addr], 'hello smtp 111')
server.quit()
