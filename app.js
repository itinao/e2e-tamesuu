'use strict';

const TestCafe = require('./lib/testcafe');
const express = require('express');

const app  = express();
const port = 3000;
let testcafe_url = null;

app.get("/", (req, res) => {
  const testcafe = TestCafe({host: '127.0.0.1', port1: 1337, port: 1338});
  testcafe.serve()
    .then(remoteConnectionURL => {
      testcafe_url = remoteConnectionURL;
      res.send(remoteConnectionURL);
    })
    .catch(_e => {
      res.send(testcafe_url);
    })
});

app.listen(port, () => {
  console.log(`listening at http://localhost:${port}`);
});
