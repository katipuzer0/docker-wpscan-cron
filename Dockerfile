FROM wpscanteam/wpscan:latest 
MAINTAINER Joseph Anthony C. Hermocilla <jachermocilla@gmail.com>
RUN wpscan --update -v
ENTRYPOINT ["sh","/shared/start.sh"]
