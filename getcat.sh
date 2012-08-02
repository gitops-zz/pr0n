#!/bin/bash
url=$1
dir=`date +%H_%M_%j`

mkdir $dir
cd $dir

for x in `curl $url | grep -oP '(?<=<a href="/)[0-9]*(?=" tit)' | uniq`; do sh ../getit.sh "http://www.redtube.com/$x"; done

cd ..
