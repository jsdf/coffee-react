helpers = require 'coffee-script/lib/coffee-script/helpers'

helpers.isCoffee = (filepath) -> /\.((lit)?coffee|coffee\.md|csx)$/.test filepath

helpers.hasCSXExtension = (filepath) -> /\.csx$/.test filepath

helpers.hasCSXPragma = (src) -> /^\s*#\s*@csx/.test src

module.exports = helpers