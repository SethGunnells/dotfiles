local telescope = require'telescope'
local tsBuiltin = require'telescope.builtin'
local trouble = require'trouble.providers.telescope'
local themes = require'telescope.themes'

telescope.setup({
  defaults = {
    layout_config = {
      horizontal = {
        height = function(_, _, r) return r - 2 end,
        width = function(_, c) return c - 2 end,
      },
      vertical = {
        height = function(_, _, r) return r - 2 end,
        width = function(_, c) return c - 2 end,
      },
    },
    mappings = {
      i = { ["<c-t>"] = trouble.smart_open_with_trouble },
      n = { ["<c-t>"] = trouble.smart_open_with_trouble },
    },
    path_display = {
      shorten = 4,
    },
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
telescope.load_extension('neoclip')
telescope.load_extension('ui-select')

local map = vim.keymap.set
map('n', '<leader>f', tsBuiltin.find_files)
map('n', '<leader>g', tsBuiltin.live_grep)
map('n', '<leader>G', tsBuiltin.grep_string)
map('n', '<leader><leader>/', tsBuiltin.current_buffer_fuzzy_find)
map('n', '<leader>b', tsBuiltin.buffers)
map('n', '<leader>r', tsBuiltin.lsp_references)
map('n', '<leader>d', tsBuiltin.lsp_definitions)
map('n', '<leader>T', tsBuiltin.lsp_type_definitions)
map('n', '<leader>i', tsBuiltin.lsp_implementations)
map('n', '<leader><leader>s', tsBuiltin.lsp_document_symbols)
map('n', '<leader>e', function() tsBuiltin.diagnostics({ bufnr = 0 }) end)
map('n', '<leader>R', telescope.extensions.neoclip.default)
map('n', '<leader>+', telescope.extensions.neoclip.plus)

