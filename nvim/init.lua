-- See this for tips on Lua + Neovim:
-- https://github.com/nanotee/nvim-lua-guide

require'basic-setup'

-------------
-- PLUGINS --
-------------

require 'paq' {
  -- package manager
  'savq/paq-nvim';
  -- supporting packages
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'MunifTanjim/nui.nvim';
  -- fancy icons for nvim
  'kyazdani42/nvim-web-devicons';
  -- fancy status line
  'nvim-lualine/lualine.nvim';
  -- TreeSitter manager
  'nvim-treesitter/nvim-treesitter';
  'nvim-treesitter/nvim-treesitter-textobjects';
  -- add easy LSP configs
  'neovim/nvim-lspconfig';
  -- quickly jump around
  'ggandor/lightspeed.nvim';
  -- add autocomplete
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-path';
  'hrsh7th/cmp-cmdline';
  'hrsh7th/nvim-cmp';
  'hrsh7th/cmp-vsnip';
  'hrsh7th/vim-vsnip';
  -- fancy tabbar
  'akinsho/bufferline.nvim';
  -- file tree
  'kyazdani42/nvim-tree.lua';
  -- easily manage comments
  'terrortylor/nvim-comment';
  -- nord theme with TreeSitter support
  'shaunsingh/nord.nvim';
  -- manage html-like tags automatically
  'windwp/nvim-ts-autotag';
  -- create pairs for sensible characters automatically
  'windwp/nvim-autopairs';
  -- guides for indentation level
  'lukas-reineke/indent-blankline.nvim';
  -- dims sections of code not currently being edited
  'folke/twilight.nvim';
  -- easily change surrounding characters
  'tpope/vim-surround';
  -- telescope
  'nvim-telescope/telescope.nvim';
  {'nvim-telescope/telescope-fzy-native.nvim', run='git submodule update --init --recursive'};
  -- git sidebar and git blame
  'lewis6991/gitsigns.nvim';
  -- clipboard manager
  'AckslD/nvim-neoclip.lua';
  -- UI for diagnositics, quickfix, loclist, etc.
  'folke/trouble.nvim';
  'folke/lsp-colors.nvim';
}

require'simple-plugins'
require'autopairs'
require'theme'
require'statusline'
require'treesitter'
require'lsp'
require'completion'
require'tree'
require'tabs'
require'surround'
require'telescope-conf'

-----------------
-- END PLUGINS --
-----------------

-- Allow local ".nvimrc.lua" files
local local_vimrc = vim.fn.getcwd()..'/.nvimrc.lua'
if vim.loop.fs_stat(local_vimrc) then
  dofile(local_vimrc)
end

