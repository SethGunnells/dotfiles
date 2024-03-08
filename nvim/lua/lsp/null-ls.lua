local nullLs = require 'null-ls'
local utils = require 'null-ls.utils'
local eslint_d = require('none-ls.diagnostics.eslint_d')

nullLs.setup {
  sources = {
    eslint_d.with({
      root_dir = utils.root_pattern('.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.yml', '.eslintrc.json',
        'package.json')
    }),
    nullLs.builtins.formatting.prettier,
  },
}
