#!/usr/bin/env coffee

{test} = require('tap')

require('../register')

react = require '../example/react.coffee'

requireTest = () ->
  test 'require cjsx coffee file', (t) ->
    t.plan(2)

    SomeClass = require '../example/some-class.coffee'
    rendered = react.renderComponent SomeClass()

    t.assert rendered.type.displayName is 'div', 'correct output 1'
    t.assert rendered.props.color is 'blue', 'correct output 2'
    t.end()
        
requireTest()
