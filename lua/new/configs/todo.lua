local oky, todo = pcall(require, "todo")
if not oky then
  return
end
todo.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
})
