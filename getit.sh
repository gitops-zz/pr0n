#!/bin/bash

url=$1
html=`curl $url`
title=`echo $html | grep -Po '(?<=<h1 class="videoTitle">).+(?=</h1>)' | sed -e 's/^ *//g' -e 's/ *$//g' -e 's/ /_/g'`
video_url=`echo $html |  grep -o '<source src=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<source src=["'"'"']//' -e 's/["'"'"']$//' | head -n 1`
echo 'title'
echo $title
echo 'video_url'
echo $video_url
wget --output-document "$title.flv" $video_url 
