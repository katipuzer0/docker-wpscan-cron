FROM wpscanteam/wpscan:latest 
MAINTAINER katipuzer0 <katipuzero@gmail.com>
RUN wpscan --update -v

USER root

RUN apk update && apk add bash

RUN mkdir -p /shared/archive
WORKDIR /shared

COPY ./shared/start.sh /shared/start.sh
COPY ./shared/wp-urls.txt /shared/wp-urls.txt
COPY ./shared/crontab.txt /shared/crontab.txt
COPY ./shared/entry.sh /shared/entry.sh

RUN /usr/bin/crontab /shared/crontab.txt

#ENTRYPOINT ["sh","/shared/start.sh"]
ENTRYPOINT ["sh","/shared/entry.sh"]

