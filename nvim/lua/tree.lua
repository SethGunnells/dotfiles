treeView = {}
function treeView.open() 
  require'bufferline.state'.set_offset(31, 'FileTree')
  require'nvim-tree'.find_file(true)
end
function treeView.close()
  require'bufferline.state'.set_offset(0)
  require'nvim-tree'.close()
end
function treeView.toggle()
  if require'nvim-tree.view'.win_open() then
    treeView.close()
  else
    treeView.open()
  end
end
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>lua treeView.toggle()<CR>', { noremap = true })

