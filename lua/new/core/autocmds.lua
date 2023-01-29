vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*." },
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = format_sync_grp,
})
