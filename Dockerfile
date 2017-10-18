FROM node:6-alpine

MAINTAINER Megan Sharon

ARG NG_CLI_VERSION=1.5.0-beta.4
ARG USER_HOME_DIR="/tmp"
ARG APP_DIR="/app"

ENV NPM_CONFIG_LOGLEVEL warn
#angular-cli rc0 crashes with .angular-cli.json in user home
ENV HOME $USER_HOME_DIR


WORKDIR $APP_DIR
EXPOSE 4200

RUN set -xe \
    && apk add --update curl \
    && curl -sL https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 > /usr/bin/dumb-init \
    && chmod +x /usr/bin/dumb-init \
    && mkdir -p $HOME \
    && mkdir -p $APP_DIR \
    && chmod a+rw $HOME \
    && npm install -g @angular/cli@$NG_CLI_VERSION \
    && npm cache clean --force

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
