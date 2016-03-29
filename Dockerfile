FROM alpine:edge

MAINTAINER Thierry SALLE <seuf76@gmail.com>

RUN apk --update add git nodejs python build-base

WORKDIR /usr/share/webapps

RUN git clone https://github.com/krishnasrinivas/wetty && \
    cd wetty && \
    npm install

RUN apk del build-base

RUN apk add openssh-client

RUN addgroup seuf
RUN adduser -G seuf -h /home/seuf -s /bin/ash -D seuf

RUN echo "seuf:AlpineLinux" | chpasswd

WORKDIR /usr/share/webapps/wetty

ENTRYPOINT node app.js -p 3000
