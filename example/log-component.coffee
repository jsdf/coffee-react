util = require('util')

SomeClass = require './some-class.coffee'
react = require './react.coffee'

inspect = (value) -> util.inspect value, { showHidden: true, depth: null }

console.log inspect react.renderComponent SomeClass()