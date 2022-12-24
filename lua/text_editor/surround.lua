local ok, surround = pcall(require, 'nvim-surround')
if not ok then
  vim.notify("Failed to load surrounf plugin.")
  return
end

surround.setup({

})
