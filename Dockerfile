FROM node:alpine3.13

ENV APP_ROOT=/usr/src/e2e

RUN apk add sudo

#RUN adduser -D -u 1001 -s /bin/sh -G wheel app
#RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
#
#USER app
#
WORKDIR $APP_ROOT
#COPY --chown=app:app . $APP_ROOT
COPY . $APP_ROOT

RUN yarn install

EXPOSE 443

ENTRYPOINT ["./entrypoint.sh"]
