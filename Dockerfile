FROM node:6-alpine

MAINTAINER Megan Sharon

ARG NG_CLI_VERSION=1.5.0-beta.4
ARG USER_HOME_DIR="/tmp"
ARG APP_DIR="/app"
ARG USER_ID=1000

ENV NPM_CONFIG_LOGLEVEL warn
#angular-cli rc0 crashes with .angular-cli.json in user home
ENV HOME "$USER_HOME_DIR"

RUN set -xe \
    && apk add --update curl\
    && curl -sL https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 > /usr/bin/dumb-init \
    && chmod +x /usr/bin/dumb-init \
    && mkdir -p $USER_HOME_DIR \
    && mkdir -p $APP_DIR \
    && chown $USER_ID $USER_HOME_DIR \
    && chown $USER_ID $APP_DIR \
    && chmod a+rw $USER_HOME_DIR \
    && chown -Rf $USER_ID /usr/local/lib /usr/local/include /usr/local/share /usr/local/bin \
    && (cd $USER_HOME_DIR; npm install -g @angular/cli@$NG_CLI_VERSION) \
    && npm cache clean --force

WORKDIR $APP_DIR
EXPOSE 4200

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

USER $USER_ID
