#
# Base image for deploying node.js applications.
#
# docker-build properties:
# TAG=foodjunky/nodejs:latest

FROM foodjunky/base
MAINTAINER Jeremy Jongsma "jeremy@foodjunky.com"

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
	apt-get --yes update && \
	apt-get --yes install nodejs && \
	apt-get clean

WORKDIR /app

#CMD ["npm", "start"]
CMD "npm start 2>&1 > /var/log/ext/nodejs.log"
