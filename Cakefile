fs = require 'fs'
path = require 'path'
{spawn, exec} = require 'child_process'

{DEBUG} = process.env

COFFEE_EXECUTABLE = require.resolve('coffee-script/bin/coffee')

# ANSI Terminal Colors.
bold = red = green = reset = ''
unless process.env.NODE_DISABLE_COLORS
  bold  = '\x1B[0;1m'
  red   = '\x1B[0;31m'
  green = '\x1B[0;32m'
  reset = '\x1B[0m'
  
# Log a message with a color.
log = (message, color, explanation) ->
  console.log color + message + reset + ' ' + (explanation or '')

# Build transformer from source.
build = (cb) ->
  files = fs.readdirSync('./src')
    .filter((f) -> /\.coffee$/.test(f))
    .map(((f) -> path.basename(f, '.coffee')))
  
  run 'mkdir', ['-p','bin', 'lib'], ->
    compile files, 'src/', 'lib/', cb

compile = (srcFiles, srcDir, destDir, cb) ->
  srcFilePaths = srcFiles.map (filename) -> path.join(srcDir, "#{filename}.coffee")
  args = ['--bare', '-o', destDir, '--compile'].concat srcFilePaths
  coffee args, cb

# Run CoffeeScript command
coffee = (args, cb) -> run COFFEE_EXECUTABLE, args, cb

run = (executable, args = [], cb) ->
  console.log "#{path.basename executable} #{args.join(' ')}" if DEBUG
  proc =         spawn executable, args
  proc.stdout.on 'data', (buffer) -> log buffer.toString(), green
  proc.stderr.on 'data', (buffer) -> log buffer.toString(), red
  proc.on        'exit', (status) -> cb(status) if typeof cb is 'function'

test = ->
  run 'tap', ['test/*.coffee'], (status) ->
    if status == 0
      log 'pass', green
    else
      log 'fail', red

task 'build', 'build coffee-react from source', build

task 'test', 'test coffee-react', test

