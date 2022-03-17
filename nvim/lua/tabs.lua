local nord = require'nord.colors'

require'bufferline'.setup {
  highlights = {
    fill = {
      guibg = nord.nord1_gui,
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
    show_close_icon = false,
  },
}

local map = vim.api.nvim_set_keymap
map('n', '<leader>,', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
map('n', '<leader>.', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
map('n', '<leader><', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
map('n', '<leader>>', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
map('n', '<leader><leader>c', ':bdelete<CR>', { noremap = true, silent = true })
map('n', '<leader><leader>x', ':w | bdelete<CR>', { noremap = true, silent = true })
map('n', '<leader>p', ':BufferLinePick<CR>', { noremap = true, silent = true })
map('n', '<leader>P', ':BufferLinePickClose<CR>', { noremap = true, silent = true })

