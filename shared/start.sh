#!/bin/bash

wpfile="/share/wp-urls.txt" 

while read p; do 
  domain=`echo $p | sed -e 's#.*//##' | sed -e 's#/.*##' `
  echo $domain
  /wpscan/wpscan.rb -u $p --random-agent --enumerate vp,vt,u --threads 1 --batch --no-color --log --no-banner > /share/archive/$domain-`date +%F`.txt
done <$wpfile
