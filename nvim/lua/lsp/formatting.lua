local M = {}

function M.format()
  vim.lsp.buf.format {
    filter = function(clients)
      return vim.tbl_filter(
        function(client) return client.name ~= "tsserver" end,
        clients
      )
    end
  }
end

function M.setupFormatOnSave()
  local cmd = vim.api.nvim_command
  cmd([[command FormatEnable augroup sethfmt | exe "autocmd BufWrite * lua require'lsp/formatting'.format()" | augroup END]])
  cmd([[command FormatDisable autocmd! sethfmt BufWrite *]])
  cmd([[FormatEnable]])
end

return M
