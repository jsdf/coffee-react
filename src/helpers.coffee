helpers = require 'coffee-script/lib/coffee-script/helpers'

helpers.isCoffee = (filepath) -> /\.((lit)?coffee|coffee\.md|cjsx|csx)$/.test filepath

helpers.hasCJSXExtension = (filepath) -> /\.(cjsx|csx)$/.test filepath

helpers.hasCJSXPragma = (src) -> /^\s*#\s*@(cjsx|csx)/.test src

module.exports = helpers