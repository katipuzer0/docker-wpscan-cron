#!/bin/bash


#perform some checks
if [[ -z "$WPSCAN_API_TOKEN" ]]; then
    echo "Must set WPSCAN_API_TOKEN" 1>&2
    exit 1
fi

if [[ -z "$SLACK_AUTH_TOKEN" ]]; then
    echo "Must set SLACK_AUTH_TOKEN" 1>&2
    exit 2
fi

if [[ -z "$SLACK_CHANNEL" ]]; then
    echo "Must set SLACK_CHANNEL" 1>&2
    exit 3
fi


wpfile="/shared/wp-urls.txt" 

while read p; do 
  echo $p
  TARGET=`echo $p | sed -e 's#.*//##' | sed -e 's#/.*##' `
  echo $TARGET
  RESULT_FILENAME=/shared/archive/$TARGET.wpscan.`date +"%Y-%m-%d"`
  wpscan --url $TARGET --detection-mode aggressive --random-user-agent --ignore-main-redirect --force --no-banner  --api-token $WPSCAN_API_TOKEN --wp-content-dir wp-content --enumerate u,vp,vt,tt,cb,dbe -f cli-no-color --output $RESULT_FILENAME.json --format json
  python3 -m wpscan_out_parse --no_color $RESULT_FILENAME.json > $RESULT_FILENAME.txt 
  curl -F file=@${RESULT_FILENAME}.txt -F filetype=text -F "initial_comment=Today's WPScan Results" -F channels=$SLACK_CHANNEL -H "Authorization: Bearer $SLACK_OAUTH_TOKEN" https://slack.com/api/files.upload
done <$wpfile
