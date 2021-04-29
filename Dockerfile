FROM node:alpine3.13

ENV APP_ROOT=/usr/src/e2e

RUN addgroup -S app && adduser -S -G app app
USER app

WORKDIR $APP_ROOT
COPY --chown=app:app . $APP_ROOT

RUN yarn install

EXPOSE 3000

CMD ["/usr/local/bin/node", "app.js"]
