import { Selector } from 'testcafe';

fixture `Getting Started 2`
    .page `http://devexpress.github.io/testcafe/example`;

test('My first test2', async t => {
    await t
        .typeText('#developer-name', 'John Smith')
        .click('#submit-button');
});
