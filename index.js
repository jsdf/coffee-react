var transform = require('coffee-react-transform');
var compile = require('coffee-script').compile;

module.exports = {
  compile: function (code, options) {
    return compile(transform(code), options);
  },
  transform: transform
}