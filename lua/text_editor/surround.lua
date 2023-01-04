local ok, surround = pcall(require, 'nvim-surround')
if not ok then
  vim.notify("Failed to load surround plugin.")
  return
end

surround.setup({

})
