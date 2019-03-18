#!/usr/bin/python
# -*- coding:utf-8 -*-

import os
import sys
import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler 
sys.path.append('..')
import sendEmail

curURL = ""

def get_file_last_line(filename):
    try:
        filesize = os.path.getsize(filename)
        if(filesize == 0):
            return None
        else:
            with open(filename, 'rb') as fp:
                offset = -8
                fp.seek(offset, 2)
                lines = fp.readlines()
                if(len(lines) >= 2):
                    return lines[-1]
                else:
                    offset *= 2
                fp.seek(0)
                lines = fp.readlines()
                return lines[-1]
    except IOError, e:
        print(e)
        return None

class LogSystemEventHandler(FileSystemEventHandler):
    def __init__(self):
        super(LogSystemEventHandler, self).__init__()
    
    def on_any_event(self, event):
        if event.src_path.endswith("natapp.log"):
            #print("event %s" % event.src_path)
            line = get_file_last_line(event.src_path)
            if(line):
                idx = line.find('server.natappfree.cc')
                if(idx > -1):
                    url = line[idx:idx+28]
                    global curURL
                    if(curURL != url):
                        #print("changed:%s" % url)
                        curURL = url
                        sendEmail.send_warning_mail(curURL, "")

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else './log'
    event_handler = LogSystemEventHandler()
    observer = Observer()
    observer.schedule(event_handler, path, recursive=True)
    observer.start()
    try:
        while(True):
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
