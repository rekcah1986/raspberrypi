#!/bin/bash
# -*- coding:utf-8 -*-
cd "$( cd "$( dirname "$0"  )" && pwd )"
./watchLog.py &
sleep 5
./natapp &

