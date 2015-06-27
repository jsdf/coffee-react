visitors = require('react-tools/vendor/fbtransform/visitors')
transform = require('jstransform').transform

jsSyntaxTransform = (input, options = {}) ->
  visitorList = visitors.getVisitorsBySet(['react'])
  transform(visitorList, input, options).code

module.exports = jsSyntaxTransform
