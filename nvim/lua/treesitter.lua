require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash',
    'c',
    'c_sharp',
    'clojure',
    'comment',
    'cpp',
    'css',
    'dockerfile',
    'graphql',
    'hocon',
    'html',
    'java',
    'javascript',
    'jsdoc',
    'json',
    'lua',
    'ninja',
    'php',
    'scala',
    'tsx',
    'vim',
    'yaml',
  },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
      },
    },
  },
}

