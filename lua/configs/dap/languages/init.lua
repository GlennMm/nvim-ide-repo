local M = {}
M.setup = function(dap)
  require("configs.dap.languages.bash").setup(dap)
  require("configs.dap.languages.go").setup(dap)
  require("configs.dap.languages.js").setup(dap)
  require("configs.dap.languages.dart").setup(dap)
  require("configs.dap.languages.python").setup(dap)
  require("configs.dap.languages.rust").setup(dap)
end

return M
