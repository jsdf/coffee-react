# patches coffee-script module

fs = require 'fs'
transform = require 'coffee-react-transform'

helpers = require './helpers'

CoffeeScript = require 'coffee-script/lib/coffee-script/coffee-script'

CoffeeScript.FILE_EXTENSIONS.push '.cjsx'

CoffeeScript.register = -> require './register'

# real coffeescript compile func, which we're wrapping
CoffeeScript._csCompile = CoffeeScript.compile

CoffeeScript.compile = (code, options) ->
  input = transform(code)

  CoffeeScript._csCompile input, options

CoffeeScript._compileFile = (filename, sourceMap = no) ->
  raw = fs.readFileSync filename, 'utf8'
  stripped = if raw.charCodeAt(0) is 0xFEFF then raw.substring 1 else raw
  
  try
    answer = CoffeeScript.compile(stripped, {filename, sourceMap, literate: helpers.isLiterate filename})
  catch err
    # As the filename and code of a dynamically loaded file will be different
    # from the original file compiled with CoffeeScript.run, add that
    # information to error so it can be pretty-printed later.
    throw helpers.updateSyntaxError err, input, filename

  answer

CoffeeScript.hasCJSXPragma = helpers.hasCJSXPragma
CoffeeScript.hasCJSXExtension = helpers.hasCJSXExtension
CoffeeScript.transform = transform

module.exports = CoffeeScript