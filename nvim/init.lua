-- See this for tips on Lua + Neovim:
-- https://github.com/nanotee/nvim-lua-guide

local map = vim.api.nvim_set_keymap
local g = vim.g
local o = vim.o
local api = vim.api
local cmd = api.nvim_command

-- map the leader key
map('n', '<Space>', '', { noremap = true })
g.mapleader = ' '

-- use 'jk' to stop editing
map('i', 'jk', '<Escape>', { noremap = true })

-- Use a popup menu for completions and don't preselect an option
o.completeopt = 'menuone,noselect'
-- Uses spaces instead of tabs
o.expandtab = true
-- Keep buffers open when abandoned (not visible)
-- Useful for plugins like barbar that manage buffers
o.hidden = true
-- Add line numbers
o.number = true
-- Number of rows/columns to keep visible around the cursor
o.scrolloff = 5
o.sidescrolloff = 10
-- Number of spaces to use for tabs
o.shiftwidth = 2
-- Allow 256-bit colors
o.termguicolors = true

cmd('autocmd BufRead,BufNewFile .eslintrc set filetype=json')

-------------
-- PLUGINS --
-------------

require 'paq-nvim' {
  -- package manager
  'savq/paq-nvim';
  -- fancy icons for nvim
  'kyazdani42/nvim-web-devicons';
  -- fancy status line
  'hoob3rt/lualine.nvim';
  -- nord theme with TreeSitter support
  'shaunsingh/nord.nvim';
  -- add easy LSP configs
  'neovim/nvim-lspconfig';
  -- add autocomplete
  'hrsh7th/nvim-compe';
  -- allow plugins to use the . command
  'tpope/vim-repeat';
  -- TreeSitter manager
  'nvim-treesitter/nvim-treesitter';
  -- create pairs for sensible characters automatically
  'jiangmiao/auto-pairs';
  -- quickly jump around
  'ggandor/lightspeed.nvim';
  -- easily change surrounding characters
  'tpope/vim-surround';
  -- fancy tabbar
  'romgrk/barbar.nvim';
  -- file tree
  'kyazdani42/nvim-tree.lua';
  -- telescope
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  {'nvim-telescope/telescope-fzy-native.nvim', run='git submodule update --init --recursive'};
  -- git sidebar and manipulating changes
  'airblade/vim-gitgutter';
  -- easy comment manipulation
  'tpope/vim-commentary';
}

-- Setup Nord color scheme
require'nord'.set()

require'statusline'
require'treesitter'
require'lsp'
require'completion'
require'tree'
require'tabs'
require'telescope-conf'

-----------------
-- END PLUGINS --
-----------------

-- Allow local ".nvimrc.lua" files
local local_vimrc = vim.fn.getcwd()..'/.nvimrc.lua'
if vim.loop.fs_stat(local_vimrc) then
  dofile(local_vimrc)
end

