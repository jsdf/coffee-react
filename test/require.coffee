#!/usr/bin/env coffee

{test} = require('tap')

require('../register')

React = require 'react'

expected = require './expected/some-class'

requireTest = () ->
  test 'require cjsx coffee file', (t) ->
    t.plan(1)

    SomeClass = require '../example/some-class'
    rendered = React.renderComponentToStaticMarkup(React.createElement(SomeClass))

    t.assert rendered.length and rendered is expected, 'correct output'
    t.end()
        
requireTest()
