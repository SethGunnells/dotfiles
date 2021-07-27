local map = vim.api.nvim_set_keymap
map('n', '<leader>,', ':BufferPrevious<CR>', { noremap = true, silent = true })
map('n', '<leader>.', ':BufferNext<CR>', { noremap = true, silent = true })
map('n', '<leader><', ':BufferMovePrevious<CR>', { noremap = true, silent = true })
map('n', '<leader>>', ':BufferMoveNext<CR>', { noremap = true, silent = true })
map('n', '<leader>c', ':BufferClose<CR>', { noremap = true, silent = true })
map('n', '<leader>x', ':w | BufferClose<CR>', { noremap = true, silent = true })
map('n', '<leader>s', ':BufferPick<CR>', { noremap = true, silent = true })
map('n', '<leader>bd', ':BufferOrderByDirectory<CR>', { noremap = true, silent = true })
map('n', '<leader>bl', ':BufferOrderByLanguage<CR>', { noremap = true, silent = true })

