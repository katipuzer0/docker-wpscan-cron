# docker-wpscan-cron

docker build . -t cron-wpscan

Sending build context to Docker daemon 13.31 kB
Step 1/4 : FROM wpscanteam/wpscan:latest
latest: Pulling from wpscanteam/wpscan
6d827a3ef358: Pull complete 
cfd750008fb6: Pull complete 
3fe65b384f96: Pull complete 
e36d3273d2aa: Pull complete 
bc6e48d8929d: Pull complete 
7c91eb9fe30f: Pull complete 
1e70a95f86c8: Pull complete 
722ba65b0c36: Pull complete 
50fc43bc68ff: Pull complete 
d1723b1d2c47: Pull complete 
8d4b66af8cb9: Pull complete 
671e0a0ec979: Pull complete 
fe8db38cec4d: Pull complete 
afd38abb2d54: Pull complete 
8cfca50adfea: Pull complete 
Digest: sha256:aa04ed1b9fb3acc2b9e058ba611563872d88eae17c7949aace0aff502315bd47
Status: Downloaded newer image for wpscanteam/wpscan:latest
 ---> 9727da6633c7
Step 2/4 : MAINTAINER Markus Krell <markus@friendly-intruder.de>
 ---> Running in d48ae3c108e5
 ---> 40f5c5ce7a00
Removing intermediate container d48ae3c108e5
Step 3/4 : RUN /wpscan/wpscan.rb --update -v
 ---> Running in f33516c25cbd
_______________________________________________________________
        __          _______   _____                  
        \ \        / /  __ \ / ____|                 
         \ \  /\  / /| |__) | (___   ___  __ _ _ __ ®
          \ \/  \/ / |  ___/ \___ \ / __|/ _` | '_ \ 
           \  /\  /  | |     ____) | (__| (_| | | | |
            \/  \/   |_|    |_____/ \___|\__,_|_| |_|

        WordPress Security Scanner by the WPScan Team 
                       Version 2.9.2
          Sponsored by Sucuri - https://sucuri.net
   @_WPScan_, @ethicalhack3r, @erwan_lr, pvdl, @_FireFart_
_______________________________________________________________

[i] Updating the Database ...
[+] Checking local_vulnerable_files.xml
  [i] Already Up-To-Date
[+] Checking local_vulnerable_files.xsd
  [i] Already Up-To-Date
[+] Checking timthumbs.txt
  [i] Already Up-To-Date
[+] Checking user-agents.txt
  [i] Already Up-To-Date
[+] Checking wp_versions.xml
  [i] Already Up-To-Date
[+] Checking wp_versions.xsd
  [i] Already Up-To-Date
[+] Checking wordpresses.json
  [i] Already Up-To-Date
[+] Checking plugins.json
  [i] Already Up-To-Date
[+] Checking themes.json
  [i] Already Up-To-Date
[+] Checking LICENSE
  [i] Already Up-To-Date
[i] Update completed.
 ---> 298afb3c949b
Removing intermediate container f33516c25cbd
Step 4/4 : ENTRYPOINT /share/start.sh
 ---> Running in 5b0c7642ce04
 ---> 4dfac8e85d3c
Removing intermediate container 5b0c7642ce04
Successfully built 4dfac8e85d3c

