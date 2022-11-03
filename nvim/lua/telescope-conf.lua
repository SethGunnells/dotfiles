local map = vim.api.nvim_set_keymap
telescope = require'telescope'
tsBuiltin = require'telescope.builtin'
local trouble = require'trouble.providers.telescope'
local themes = require'telescope.themes'

telescope.setup({
  defaults = {
    layout_config = {
      horizontal = {
        height = function(_, c, r) return r - 2 end,
        width = function(_, c) return c - 2 end,
      },
      vertical = {
        height = function(_, c, r) return r - 2 end,
        width = function(_, c) return c - 2 end,
      },
    },
    mappings = {
      i = { ["<c-t>"] = trouble.smart_open_with_trouble },
      n = { ["<c-t>"] = trouble.smart_open_with_trouble },
    },
    -- path_display = {
    --   shorten = 3,
    -- },
  },
  pickers = {
    find_files = {
      find_command = { "fd", "-t=f", "-t=l", "-E=.git", "--hidden"},
      layout_strategy = "center",
      previewer = false,
    }
  },
  extensions = {
    ["ui-select"] = {
      themes.get_dropdown{}
    }
  }
})

require'neoclip'.setup()
telescope.load_extension('fzy_native')
telescope.load_extension('neoclip')
telescope.load_extension('ui-select')

map('n', '<leader>f', '<cmd>lua tsBuiltin.find_files()<cr>', { noremap = true, silent = true })
map('n', '<leader>g', '<cmd>lua tsBuiltin.live_grep()<cr>', { noremap = true, silent = true })
map('n', '<leader>G', '<cmd>lua tsBuiltin.grep_string()<cr>', { noremap = true, silent = true })
map('n', '<leader><leader>/', '<cmd>lua tsBuiltin.current_buffer_fuzzy_find()<cr>', { noremap = true, silent = true })
map('n', '<leader>b', '<cmd>lua tsBuiltin.buffers()<cr>', { noremap = true, silent = true })
map('n', '<leader>r', '<cmd>lua tsBuiltin.lsp_references()<cr>', { noremap = true, silent = true })
map('n', '<leader>d', '<cmd>lua tsBuiltin.lsp_definitions()<cr>', { noremap = true, silent = true })
map('n', '<leader>T', '<cmd>lua tsBuiltin.lsp_type_definitions()<cr>', { noremap = true, silent = true })
map('n', '<leader>i', '<cmd>lua tsBuiltin.lsp_implementations()<cr>', { noremap = true, silent = true })
map('n', '<leader><leader>s', '<cmd>lua tsBuiltin.lsp_document_symbols()<cr>', { noremap = true, silent = true })
map('n', '<leader>e', '<cmd>lua tsBuiltin.diagnostics({ bufnr = 0 })<cr>', { noremap = true, silent = true })
map('n', '<leader>R', '<cmd>lua telescope.extensions.neoclip.default()<cr>', { noremap = true, silent = true })
map('n', '<leader>+', '<cmd>lua telescope.extensions.neoclip.plus()<cr>', { noremap = true, silent = true })

