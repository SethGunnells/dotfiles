-- bootstrap lazy plugin loader
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local map = vim.keymap.set
local g = vim.g
local o = vim.o
local cmd = vim.api.nvim_command

-- map the leader key
map('n', '<Space>', '')
g.mapleader = ' '

-- use 'jk' to stop editing
map('i', 'jk', '<Escape>', { desc = 'Stop editing' })

-- More easily copy to system clipboard
map({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })

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
-- Add automatic highlighting for vlang
cmd('autocmd BufRead,BufNewFile *.v set filetype=vlang')
