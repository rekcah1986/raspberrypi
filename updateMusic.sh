#!/bin/bash
cd "$( cd "$( dirname "$0"  )" && pwd  )"
pwd
ID=489448787
DIR=playlist$ID
#rm -rf $DIR
netease-dl playlist --id $ID
mv $DIR/*.mp3 /home/pi/Music
find /home/pi/Music/*.mp3 > clock.lst 
