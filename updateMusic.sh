#!/bin/bash
cd "$( cd "$( dirname "$0"  )" && pwd  )"
echo download musics...
ID=489448787
DIR=playlist$ID
#rm -rf $DIR
netease-dl playlist --id $ID
echo make play list...
mv $DIR/*.mp3 /home/pi/Music
rm -rf $DIR
find /home/pi/Music/*.mp3 > clock.lst 
echo finish.
