local M = {}

local function makeAutocmd()
  local id = vim.api.nvim_create_augroup('sethfmt', {
    clear = false
  })
  vim.api.nvim_create_autocmd({ 'BufWrite' }, {
    buffer = 0,
    group = id,
    callback = M.format
  })
end

function M.format()
  vim.lsp.buf.format {
    filter = function(client) return client.name ~= "tsserver" end,
  }
end

function M.setupFormatOnSave()
  vim.api.nvim_buf_create_user_command(0, 'FormatEnable', makeAutocmd, {})

  vim.api.nvim_buf_create_user_command(0, 'FormatDisable', function()
    vim.api.nvim_del_augroup_by_name('sethfmt')
  end, {})

  makeAutocmd()
end

return M
