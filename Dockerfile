FROM testcafe/testcafe:1.13.0

ENV APP_ROOT=/usr/src/e2e

WORKDIR $APP_ROOT
COPY --chown=app:app . $APP_ROOT
