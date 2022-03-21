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

-- More easily copy to system clipboard
map('n', '<leader>y', '"+y', { noremap = true })
map('x', '<leader>y', '"+y', { noremap = true })

-- Use a popup menu for completions and don't preselect an option
o.completeopt = 'menu,menuone,noselect'
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
-- Split to the right, the more intuitive option
vim.opt.splitright = true

-- Add automatic highlighting for ESLint
cmd('autocmd BufRead,BufNewFile .eslintrc set filetype=json')
-- Add automatic highlighting for HOCON
cmd('autocmd BufRead,BufNewFile *.conf set filetype=hocon')
