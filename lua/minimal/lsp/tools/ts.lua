local M = {}

local oky, tools = pcall(require, "ts")
if not oky then
  vim.notify("Failed to load typescript tools", vim.log.levels.WARN)
  return
end

M.setup = function ()
  local ts = "typescript"
end


return M
