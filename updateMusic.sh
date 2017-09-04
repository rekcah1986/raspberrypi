#!/bin/bash
cd "$( cd "$( dirname "$0"  )" && pwd  )"
pwd
ID=489448787
DIR=playlist$ID
#rm -rf $DIR
netease-dl playlist --id $ID
find $DIR/*.mp3 > clock.lst 
