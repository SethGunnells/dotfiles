local cmd = vim.api.nvim_command
cmd([[command FormatEnable augroup sethfmt | exe "autocmd BufWrite * lua vim.lsp.buf.formatting_sync(nil, 1000)" | augroup END]])
cmd([[command FormatDisable autocmd! sethfmt BufWrite *]])
cmd([[FormatEnable]])

