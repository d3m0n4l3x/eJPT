#!/usr/bin/python3
#[python][eJPT] Check HTTP Verbs
#https://github.com/d3m0n4l3x/python/blob/master/toys/check_http_options.py
import http.client
import re

def convertTuple(tup):
    str =  ': '.join(tup)
    return str

target=input("Your Target: ")
port=input("TCP Port (default: 80): ")

if port == "":
    port=80

port=int(port)

conn = http.client.HTTPConnection(target, port)
conn.request("OPTIONS", "/")
r1 = conn.getresponse()

response = r1.getheaders()

for each_item in response:
    each_item=convertTuple(each_item)
    result=re.match( r'^allow: ', each_item.lower())
    if result:
        print(each_item)
        exit(0)


print("There is no Allow field!")
