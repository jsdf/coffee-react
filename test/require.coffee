#!/usr/bin/env coffee

fs = require 'fs'
{test} = require('tap')

require('../register')

React = require 'react'

test 'require cjsx coffee file', (t) ->
  t.plan(1)

  expected = fs.readFileSync './expected/rendered-output.html', encoding: 'utf8'

  SomeClass = require '../example/some-class'
  rendered = React.renderToStaticMarkup(React.createElement(SomeClass))

  t.equal rendered, expected, 'correct output'
  t.end()
