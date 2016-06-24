#
# Base image for deploying node.js applications.
#
# docker-build properties:
# TAG=foodjunky/nodejs:latest

FROM ubuntu:xenial
MAINTAINER Jeremy Jongsma "jeremy@foodjunky.com"

ENV NODE_ENV production
RUN apt-get --yes update && \
	apt-get --yes install curl git && \
	curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
	apt-get --yes update && \
	apt-get --yes install nodejs && \
	apt-get clean && \
	mkdir /var/log/nodejs

WORKDIR /app

CMD npm start 2>&1 > /var/log/nodejs/nodejs.log
