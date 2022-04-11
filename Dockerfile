FROM wpscanteam/wpscan:latest 
MAINTAINER katipuzer0 <katipuzero@gmail.com>
RUN wpscan --update -v

USER root
RUN mkdir -p /shared/archive
WORKDIR /shared
COPY ./shared/start.sh /shared/start.sh
COPY ./shared/wp-urls.txt /shared/wp-urls.txt

ENTRYPOINT ["sh","/shared/start.sh"]
