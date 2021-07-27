require'lualine'.setup {
  options = {
    theme = 'nord'
  },
  sections = {
    lualine_x = {'encoding', 'filetype', {'diagnostics', sources = {'nvim_lsp'}}},
    lualine_y = {}
  }
}

