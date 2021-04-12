#!/bin/sh

echo "aaaa"
whoami
groups

BASE_HOST=0.0.0.0
if [ -n "$TEST_CAFE_HOST" ]; then
  BASE_HOST=$TEST_CAFE_HOST
#  echo "127.0.0.1 $TEST_CAFE_HOST" | sudo tee -a /etc/hosts
  echo "127.0.0.1 $TEST_CAFE_HOST" >> /etc/hosts
fi

#PORT1=1337
PORT1=443
PORT2=1338

cat /etc/hosts
ls -l /etc/hosts

exec yarn run testcafe --hostname ${BASE_HOST} --ports ${PORT1},${PORT2} remote tests/*.js
#exec "$@"
