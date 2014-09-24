helpers = require 'coffee-script/lib/coffee-script/helpers'

helpers.isCoffee = (filepath) -> /\.((lit)?coffee|coffee\.md|cjsx)$/.test filepath

helpers.hasCJSXExtension = (filepath) -> /\.(cjsx)$/.test filepath

helpers.hasCJSXPragma = (src) -> /^\s*#\s*@(cjsx)/.test src

module.exports = helpers