### Introduction

Cron-schedule WPScan of Wordpress sites using docker and docker-compose with results 
being posted to a slack channel.


### Usage

* Edit crontab.txt to reflect the desired schedule to run the scan
* Create a `.env` file
* Set the `SLACK_OAUTH_TOKEN` value in the `.env`
* Set the `WPSCAN_API_TOKEN` value in the `.env`
* Add the sites to scan in wp-urls.txt

`docker-compose build`

`docker-compose up -d`
