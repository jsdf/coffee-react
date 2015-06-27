#!/usr/bin/env coffee

fs = require 'fs'
{spawn, exec} = require 'child_process'
{test} = require('tap')
concat = require 'concat-stream'

run = (executable, args = [], outStream, errStream, cb) ->
  proc = spawn executable, args
  proc.stdout.pipe outStream
  proc.stderr.pipe errStream
  proc.on 'err', (err) -> cb(err)
  proc.on 'exit', (status) -> cb(null, status)

test 'compile cjsx file', (t) ->
  t.plan(1)

  file = '../example/named-component.coffee'
  expected = fs.readFileSync './expected/compiled-output.js', encoding: 'utf8'

  outStream = concat {encoding: 'buffer'}, (output) ->
    t.equal output.toString(), expected, 'got output'

  errStream = concat {encoding: 'buffer'}, (output) ->
    if output.toString().length
      t.fail output.toString()

  run require.resolve('../bin/cjsx'), ['-cp', file], outStream, errStream, (err, status) ->
    t.fail(err) if err
    t.fail(status) if status isnt 0
    t.end()
