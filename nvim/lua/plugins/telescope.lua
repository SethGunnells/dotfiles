local kind_filters = {
  default = {
    "Class",
    "Constructor",
    "Enum",
    "Field",
    "Function",
    "Interface",
    "Method",
    "Module",
    "Namespace",
    "Package",
    "Property",
    "Struct",
    "Trait",
  },
  markdown = false,
  help = false,
  lua = {
    "Class",
    "Constructor",
    "Enum",
    "Field",
    "Function",
    "Interface",
    "Method",
    "Module",
    "Namespace",
    "Property",
    "Struct",
    "Trait",
  },
}

local function filter_lsp_symbols()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].filetype
  if kind_filters[ft] == false then
    return
  end
  return kind_filters.default
end

local function is_git_repo()
  vim.fn.system('git rev-parse --is-inside-work-tree')
  return vim.v.shell_error == 0
end

local function get_git_root_opts()
  local opts = {}
  if is_git_repo() then
    local dot_git_path = vim.fn.finddir('.git', '.;')
    opts = { cwd = vim.fn.fnamemodify(dot_git_path, ':h') }
  end
  return opts
end

local function make_find_files(from_root)
  return function()
    local opts = {
      hidden = true,
      previewer = false,
      path_display = {
        shorten = {
          len = 5,
          exclude = { -1, -2 }
        }
      }
    }
    if from_root then
      opts = vim.tbl_extend('force', opts, get_git_root_opts())
    end
    require('telescope.builtin').find_files(opts)
  end
end

local function live_grep()
  local opts = vim.tbl_extend('force', get_git_root_opts(), {
    layout_strategy = 'vertical',
  })
  require('telescope.builtin').live_grep(opts)
end

local function grep_string()
  local opts = vim.tbl_extend('force', get_git_root_opts(), {
    layout_strategy = 'vertical',
  })
  require('telescope.builtin').grep_string(opts)
end

local function current_buffer_fuzzy_find()
  require('telescope.builtin').current_buffer_fuzzy_find({
    layout_strategy = 'vertical',
  })
end

local function make_lsp(name)
  return function()
    require('telescope.builtin')[name]({
      layout_strategy = 'cursor',
      layout_config = {
        height = 20,
      }
    })
  end
end

return {
  'nvim-telescope/telescope.nvim',
  version = false,
  cmd = 'Telescope',
  keys = {
    { '<leader>p', '<cmd>Telescope buffers sort_mru=true<cr>', desc = 'Telescope - Pick Buffer' },
    { '<leader>b', current_buffer_fuzzy_find,                  desc = 'Telescope - Fuzzy Find in Buffer' },
    { '<leader>f', make_find_files(false),                     desc = 'Telescope - Find Files (CWD)' },
    { '<leader>F', make_find_files(true),                      desc = 'Telescope - Find Files (Git Root)' },
    { '<leader>s', live_grep,                                  desc = 'Telescope - Live Grep' },
    { '<leader>H', '<cmd>Telescope help_tags<cr>',             desc = 'Telescope - Help Tags' },
    { '<leader>r', make_lsp('lsp_references'),                 desc = 'Telescope - LSP References' },
    { '<leader>d', make_lsp('lsp_definitions'),                desc = 'Telescope - LSP Definitions' },
    { '<leader>t', make_lsp('lsp_type_definitions'),           desc = 'Telescope - LSP Type Definitions' },
    {
      '<leader>S',
      grep_string,
      mode = { 'n', 'x' },
      desc = 'Telescope - Grep String'
    },
    {
      '<leader>ls',
      function()
        require('telescope.builtin').lsp_document_symbols({
          symbols = filter_lsp_symbols()
        })
      end,
      desc = 'Telescope - LSP Symbols (Document)'
    },
    {
      '<leader>lS',
      function()
        require('telescope.builtin').lsp_dynamic_workspace_symbols({
          symbols = filter_lsp_symbols()
        })
      end,
      desc = 'Telescope - LSP Symbols (Workspace)'
    },
  },
  opts = function()
    local function open_with_trouble(...)
      return require('trouble.providers.telescope').open_with_trouble(...)
    end

    local function open_selected_with_trouble(...)
      return require('trouble.providers.telescope').open_selected_with_trouble(...)
    end

    return {
      defaults = {
        mappings = {
          i = {
            ['<C-t>'] = open_with_trouble,
            ['<C-T>'] = open_selected_with_trouble,
          }
        }
      }
    }
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  }
}
