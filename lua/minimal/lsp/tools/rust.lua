local M = {}

local oky, tools = pcall(require, "rust-tools")
if not oky then
  vim.notify("Failed to load rust tools", vim.log.levels.WARN)
  return
end

M.setup = function()
  local name = "rust"
end

return M
