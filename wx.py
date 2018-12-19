#!/usr/bin/python

from flask import Flask, make_response, request 
import xml.etree.ElementTree as ET
import json, random, re, urllib, urllib2, hashlib, time
import requests

app = Flask(__name__)

def text_reply(msg):
        info = msg.encode('utf-8')
        url = 'http://www.tuling123.com/openapi/api'
        data = {u"key": "174b9e2f16b94d01a9a989e81964b0f8", "info": info, u"loc": "", "userid": ""}
        response=requests.post(url,data).content
        s = json.loads(response, encoding='utf-8')
        return s['text']

@app.route("/weixin/", methods=["GET", "POST"])
def wechat_auth():
    if request.method == "GET":
        my_signature = request.args.get('signature')
        my_timestamp = request.args.get('timestamp')
        my_nonce = request.args.get('nonce')
        my_echostr = request.args.get('echostr')

        token = 'yahaha'

        data = [token, my_timestamp, my_nonce]
        data.sort()

        temp = ''.join(data)
        mysignature = hashlib.sha1(temp).hexdigest()

        if my_signature == mysignature:
            return make_response(my_echostr)
    else:
        rec=request.stream.read()
        xml_rec=ET.fromstring(rec)
        tou = xml_rec.find('ToUserName').text
        fromu = xml_rec.find('FromUserName').text
        content = xml_rec.find('Content').text
        content = text_reply(content)
        xml_rep = "<xml><ToUserName><![CDATA[%s]]></ToUserName><FromUserName><![CDATA[%s]]></FromUserName><CreateTime>%s</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[%s]]></Content><FuncFlag>0</FuncFlag></xml>"
        response = make_response(xml_rep % (fromu, tou, str(int(time.time())), content))
        response.content_type = 'application/xml'
        return response

if __name__ == '__main__':
    app.run(port=80,debug=True)
