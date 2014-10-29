util = require('util')

SomeClass = require './some-class.coffee'
React = require 'react'

process.stdout.write React.renderToStaticMarkup(React.createElement(SomeClass))
