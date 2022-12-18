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

local map = vim.keymap.set
map('n', '<leader>,', ':BufferLineCyclePrev<CR>', { silent = true })
map('n', '<leader>.', ':BufferLineCycleNext<CR>', { silent = true })
map('n', '<leader><', ':BufferLineMovePrev<CR>', { silent = true })
map('n', '<leader>>', ':BufferLineMoveNext<CR>', { silent = true })
map('n', '<leader><leader>c', ':BufDel<CR>', { silent = true })
map('n', '<leader><leader>x', ':w | BufDel<CR>', { silent = true })
map('n', '<leader>p', ':BufferLinePick<CR>', { silent = true })
map('n', '<leader>P', ':BufferLinePickClose<CR>', { silent = true })

