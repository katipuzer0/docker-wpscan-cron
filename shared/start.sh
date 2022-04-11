#!/bin/bash

#Needed environment variables
# $SLACK_WEBHOOK_URL
# $WPSCAN_API_TOKEN


wpfile="/shared/wp-urls.txt" 

while read p; do 
  echo $p
  TARGET=`echo $p | sed -e 's#.*//##' | sed -e 's#/.*##' `
  echo $TARGET
  #wpscan -u $TARGET --random-agent --enumerate vp,vt,u --threads 1 --batch --no-color --log --no-banner > /shared/archive/$domain-`date +%F`.txt
  #wpscan --url $TARGET --random-user-agent --ignore-main-redirect --enumerate vp,vt,u --no-banner > /shared/archive/$domain-`date +%F`.txt
  #wpscan --url $TARGET --random-user-agent --ignore-main-redirect --enumerate vp,vt,u --no-banner 
  #wpscan --url $TARGET --random-user-agent --ignore-main-redirect --enumerate vp,vt,u 
  #wpscan --url $TARGET --detection-mode aggressive --random-user-agent --ignore-main-redirect --force --wp-content-dir wp-content --api-token $WPSCAN_API_TOKEN --enumerate u,vp,vt,tt,cb,dbe -f cli-no-color | tee /shared/archive/$TARGET.wpscan.`date +"%Y-%m-%d"`
  wpscan --url $TARGET --detection-mode aggressive --random-user-agent --ignore-main-redirect --force --wp-content-dir wp-content --enumerate u,vp,vt,tt,cb,dbe -f cli-no-color | tee /shared/archive/$TARGET.wpscan.`date +"%Y-%m-%d"`
done <$wpfile
