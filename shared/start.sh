#!/bin/bash

wpfile="/shared/wp-urls.txt" 

while read p; do 
  domain=`echo $p | sed -e 's#.*//##' | sed -e 's#/.*##' `
  echo $domain
  #wpscan -u $p --random-agent --enumerate vp,vt,u --threads 1 --batch --no-color --log --no-banner > /shared/archive/$domain-`date +%F`.txt
  wpscan --url $p --random-user-agent --ignore-main-redirect --enumerate vp,vt,u --no-banner > /shared/archive/$domain-`date +%F`.txt
done <$wpfile
