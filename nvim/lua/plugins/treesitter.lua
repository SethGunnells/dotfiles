return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'LazyFile', 'VeryLazy' },
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    main = 'nvim-treesitter.configs',
    opts = {
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
        'typescript',
        'vim',
        'yaml',
      },
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-Space>',
          node_incremental = '<C-Space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ai'] = '@conditional.outer',
            ['ii'] = '@conditional.inner',
          },
        },
      },
      autotag = {
        enable = true,
      }
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'LazyFile',
    opts = { mode = 'cursor', max_lines = 3 },
  },
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'javascript',
      'javascript.jsx',
      'typescript',
      'typescript.tsx',
      'typescriptreact',
      'html',
      'markdown',
    },
  },
}
