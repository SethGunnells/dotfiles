-- disable semantic highlighting from LSP
local id = vim.api.nvim_create_augroup('sethhi', {})
vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  buffer = 0,
  group = id,
  callback = function()
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end
  end
})


return {
  'shaunsingh/nord.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme nord]])

    local util = require 'nord.util'
    local nord = require 'nord.colors'

    local colorSet = {
      TSComment = { fg = nord.nord3_gui_bright, style = 'italic' },
      NormalFloat = { bg = nord.nord1_gui },
      FloatBorder = { fg = nord.nord8_gui, bg = nord.nord1_gui },
      CmpItemAbbrDeprecated = { fg = nord.nord6_gui, bg = 'NONE', style = 'strikethrough' },
      CmpItemAbbrMatch = { fg = nord.nord8_gui, bg = 'NONE', style = 'bold' },
      CmpItemAbbrMatchFuzzy = { fg = nord.nord8_gui, bg = "NONE", style = 'bold' },
      CmpItemMenu = { fg = nord.nord15_gui, bg = 'NONE', style = 'italic' },
      CmpItemKindField = { fg = nord.nord6_gui, bg = nord.nord11_gui },
      CmpItemKindProperty = { fg = nord.nord6_gui, bg = nord.nord11_gui },
      CmpItemKindEvent = { fg = nord.nord6_gui, bg = nord.nord11_gui },
      CmpItemKindText = { fg = nord.nord6_gui, bg = nord.nord14_gui },
      CmpItemKindEnum = { fg = nord.nord6_gui, bg = nord.nord14_gui },
      CmpItemKindKeyword = { fg = nord.nord6_gui, bg = nord.nord14_gui },
      CmpItemKindConstant = { fg = nord.nord6_gui, bg = nord.nord13_gui },
      CmpItemKindConstructor = { fg = nord.nord6_gui, bg = nord.nord13_gui },
      CmpItemKindReference = { fg = nord.nord6_gui, bg = nord.nord13_gui },
      CmpItemKindFunction = { fg = nord.nord6_gui, bg = nord.nord15_gui },
      CmpItemKindStruct = { fg = nord.nord6_gui, bg = nord.nord15_gui },
      CmpItemKindClass = { fg = nord.nord6_gui, bg = nord.nord15_gui },
      CmpItemKindModule = { fg = nord.nord6_gui, bg = nord.nord15_gui },
      CmpItemKindOperator = { fg = nord.nord6_gui, bg = nord.nord15_gui },
      CmpItemKindVariable = { fg = nord.nord6_gui, bg = nord.nord10_gui },
      CmpItemKindFile = { fg = nord.nord6_gui, bg = nord.nord10_gui },
      CmpItemKindUnit = { fg = nord.nord6_gui, bg = nord.nord12_gui },
      CmpItemKindSnippet = { fg = nord.nord6_gui, bg = nord.nord12_gui },
      CmpItemKindFolder = { fg = nord.nord6_gui, bg = nord.nord12_gui },
      CmpItemKindMethod = { fg = nord.nord6_gui, bg = nord.nord9_gui },
      CmpItemKindValue = { fg = nord.nord6_gui, bg = nord.nord9_gui },
      CmpItemKindEnumMember = { fg = nord.nord6_gui, bg = nord.nord9_gui },
      CmpItemKindInterface = { fg = nord.nord6_gui, bg = nord.nord8_gui },
      CmpItemKindColor = { fg = nord.nord6_gui, bg = nord.nord8_gui },
      CmpItemKindTypeParameter = { fg = nord.nord6_gui, bg = nord.nord8_gui },
    }

    util.loadColorSet(colorSet)
  end
}
