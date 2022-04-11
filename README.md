### Introduction

Cron-schedule WPScan of Wordpress sites using docker and docker-compose with results 
being posted to a slack channel.


### Usage

* Edit crontab.txt to reflect the desired schedule to run the scan
* Set the Slack Webhook Token
* Set the WPScan API Token
* Add the sites to scan in wp-urls.txt

`docker-compose build`

`docker-compose up -d`
