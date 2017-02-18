// aeldardin.js (abridged)

var requirejs = require('requirejs');

requirejs.config({
    nodeRequire: require
});

requirejs([
    'test-func'
  ],
function (testFunc) {

  debugger;
});
