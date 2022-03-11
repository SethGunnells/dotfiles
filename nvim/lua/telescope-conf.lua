local map = vim.api.nvim_set_keymap

require'telescope'.setup({ defaults = {path_display = { shorten = 3 }} })
require'telescope'.load_extension('fzy_native')
telescope = require'telescope.builtin'

map('n', '<leader>f', '<cmd>lua telescope.find_files()<CR>', { noremap = true, silent = true })
map('n', '<leader>g', '<cmd>lua telescope.grep_string()<CR>', { noremap = true, silent = true })
map('n', '<leader>G', '<cmd>lua telescope.live_grep()<CR>', { noremap = true, silent = true })
map('n', '<leader><leader>b', '<cmd>lua telescope.buffers()<CR>', { noremap = true, silent = true })
map('n', '<leader>r', '<cmd>lua telescope.lsp_references()<CR>', { noremap = true, silent = true })
map('n', '<leader>d', '<cmd>lua telescope.lsp_definitions()<CR>', { noremap = true, silent = true })
map('n', '<leader><leader>s', '<cmd>lua telescope.lsp_document_symbols()<CR>', { noremap = true, silent = true })
map('n', '<leader>a', '<cmd>lua telescope.lsp_code_actions()<CR>', { noremap = true, silent = true })
map('x', '<leader>a', '<cmd>lua telescope.lsp_range_code_actions()<CR>', { noremap = true, silent = true })
map('n', '<leader>e', '<cmd>lua telescope.lsp_document_diagnostics()<CR>', { noremap = true, silent = true })
map('n', '<leader>i', '<cmd>lua telescope.lsp_implementations()<CR>', { noremap = true, silent = true })
map('n', '<leader><leader>t', '<cmd>lua telescope.treesitter()<CR>', { noremap = true, silent = true })
map('n', '<leader><leader>B', '<cmd>lua telescope.builtin()<CR>', { noremap = true, silent = true })

