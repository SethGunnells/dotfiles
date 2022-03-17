vim.g.nord_italic = false
require'nord'.set()

local util = require'nord.util'
local nord = require'nord.colors'

local colorSet = {
  BufferLineNvimTreeOffset = { fg = nord.nord15_gui, style = 'bold' },
  TSComment = { fg = nord.nord3_gui_bright, style = 'italic' },
  NormalFloat = { bg = nord.nord1_gui },
  FloatBorder = { bg = nord.nord1_gui },
}

util.loadColorSet(colorSet)
