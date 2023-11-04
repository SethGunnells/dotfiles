local nullLs = require 'null-ls'
local utils = require 'null-ls.utils'

local shouldRunEslint = function(utils)
  if utils.root_has_file({ '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.yml', '.eslintrc.json' }) then
    return true
  elseif not utils.root_has_file({ 'package.json' }) then
    return false
  end
  local succeeded, packageJsonContents = pcall(function() return vim.fn.readfile('package.json') end)
  if not succeeded then return false end
  local packageJson = vim.fn.json_decode(packageJsonContents)
  return packageJson.eslintConfig ~= nil
end

nullLs.setup {
  sources = {
    nullLs.builtins.code_actions.eslint_d.with({
      -- condition = shouldRunEslint,
      root_dir = utils.root_pattern('.eslintrs.js', '.eslintrs.cjs', '.eslintrc.yaml', '.eslintrc.yml', '.eslintrc.json',
        'package.json')
    }),
    nullLs.builtins.diagnostics.eslint_d.with({
      --condition = shouldRunEslint,
      root_dir = utils.root_pattern('.eslintrs.js', '.eslintrs.cjs', '.eslintrc.yaml', '.eslintrc.yml', '.eslintrc.json',
        'package.json')
    }),
    nullLs.builtins.formatting.prettier,
  },
}
