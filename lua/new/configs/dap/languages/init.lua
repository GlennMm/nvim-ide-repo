local M = {}
M.setup = function(dap)
  require("new.configs.dap.languages.bash").setup(dap)
  require("new.configs.dap.languages.go").setup(dap)
  require("new.configs.dap.languages.js").setup(dap)
  require("new.configs.dap.languages.dart").setup(dap)
  require("new.configs.dap.languages.python").setup(dap)
  require("new.configs.dap.languages.rust").setup(dap)
end

return M
