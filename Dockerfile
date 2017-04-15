FROM wpscanteam/wpscan:latest 
MAINTAINER Markus Krell <markus@friendly-intruder.de>
RUN /wpscan/wpscan.rb --update -v
ENTRYPOINT ["/share/start.sh"]
