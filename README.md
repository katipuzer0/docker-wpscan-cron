### Introduction

Cron-schedule WPScan of Wordpress sites using docker and docker-compose with results 
summary posted to a slack channel.

### Usage

First obtain a WPScan API token then create a new app in your Slack workspace.


* Edit `crontab.txt` to reflect the desired schedule to run the scan
* Create a `.env` file
* Set the `SLACK_OAUTH_TOKEN` value in the `.env`
* Set the `SLACK_CHANNEL` value in the `.env`
* Set the `WPSCAN_API_TOKEN` value in the `.env`
* Add the Wordpress sites to scan in `/shared/wp-urls.txt`

`docker-compose build`

`docker-compose up -d`
