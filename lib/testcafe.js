'use strict';

const createTestCafe = require('testcafe');

const internals = {};
exports = module.exports = function (options) {
  return new internals.TestCafe(options);
};

internals.TestCafe = class {
  constructor(options) {
    this._options = options;
  }

  async serve() {
    try {
      const testcafe = await createTestCafe(this._options.host, this._options.port1, this._options.port2);
      const runner = testcafe.createRunner();
      const remoteConnection = await testcafe.createBrowserConnection();

      remoteConnection.once('ready', async () => {
        const failedCount = await runner
              .src('tests/*.js')
              .browsers(remoteConnection)
              .run();

        //console.log(failedCount);
        await testcafe.close();
      });

      return remoteConnection.url;
    } catch (e) {
      console.log(e);
      throw new Error(e.code); 
    }
  }
};
