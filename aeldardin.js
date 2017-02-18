// aeldardin.js (abridged)

var requirejs = require('requirejs');

requirejs.config({
    nodeRequire: require
});

requirejs([
    'test-func'
  ],
function (testFunc) {

    var worker = testFunc.Test.worker();

    worker.ports.done.subscribe(function(value) {
      console.log('From Elm ' + value);
    });

    var message = 'Hi';
    console.log('Before sending message: ' + message);
    worker.ports.test.send(message);
    console.log('After sending message: ' + message);
});
