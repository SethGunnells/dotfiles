local nord = require'nord.colors'

require'bufferline'.setup {
  highlights = {
    fill = {
      bg = nord.nord1_gui,
    },
  },
  options = {
    offsets = {
      {
        filetype = 'NvimTree',
        text = '  File Explorer',
        text_align = 'center',
        highlight = 'BufferLineNvimTreeOffset'
      },
    },
  },
}

local map = vim.api.nvim_set_keymap
map('n', '<leader>,', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
map('n', '<leader>.', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
map('n', '<leader><', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
map('n', '<leader>>', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
map('n', '<leader><leader>c', ':BufDel<CR>', { noremap = true, silent = true })
map('n', '<leader><leader>x', ':w | BufDel<CR>', { noremap = true, silent = true })
map('n', '<leader>p', ':BufferLinePick<CR>', { noremap = true, silent = true })
map('n', '<leader>P', ':BufferLinePickClose<CR>', { noremap = true, silent = true })

