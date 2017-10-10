#!/bin/sh  
## AUTHOR: hsj 
# DATE : 2017.10.10#  
revision=`svn info |grep "Last Changed Rev:" |awk '{print $4}'`  
echo "******the revision is $revision******"  
echo "▼▼▼▼▼▼svn up start▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼"  
svn up  
echo "▲▲▲▲▲▲svn up finish▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲"   
echo "▼▼▼▼▼▼apk build start▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼" 
./gradlew assemblerelease 
echo "▲▲▲▲▲▲apk build finish▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲" 
echo "▼▼▼▼▼▼scp apk start▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼"  
scp -P 7002 build/outputs/apk/XPostManager-release.apk root@211.156.195.19:/yygk/ggwdata/data/app
#scp -P 7002 test.txt root@211.156.195.19:/yygk/ggwdata/data/app
#scp  build/outputs/apk/XPostManager-release.apk src
echo "▲▲▲▲▲▲ascp apk finish▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲" 
echo "▼▼▼▼▼▼update server version start▼▼▼▼" 
python updateVersion.py
echo "▲▲▲▲▲▲update server version finish▲▲▲" 
read -p "按回车继续"
echo "继续"