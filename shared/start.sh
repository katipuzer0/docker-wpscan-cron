#!/bin/bash

#Needed environment variables
# $SLACK_WEBHOOK_URL
# $WPSCAN_API_TOKEN


wpfile="/shared/wp-urls.txt" 

while read p; do 
  echo $p
  TARGET=`echo $p | sed -e 's#.*//##' | sed -e 's#/.*##' `
  echo $TARGET
  RESULT_FILENAME=/shared/archive/$TARGET.wpscan.`date +"%Y-%m-%d"`
  wpscan --url $TARGET --detection-mode aggressive --random-user-agent --ignore-main-redirect --force --no-banner  --api-token $WPSCAN_API_TOKEN --wp-content-dir wp-content --enumerate u,vp,vt,tt,cb,dbe -f cli-no-color --output $RESULT_FILENAME.json --format json
  python3 -m wpscan_out_parse --no_color $RESULT_FILENAME.json > $RESULT_FILENAME.txt 
  curl -F file=@${RESULT_FILENAME}.txt -F filetype=text -F "initial_comment=Today's WPScan Results" -F channels=uplb-website -H "Authorization: Bearer $SLACK_OAUTH_TOKEN" https://slack.com/api/files.upload
done <$wpfile
