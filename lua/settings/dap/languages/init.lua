local M = {}
M.setup_adapter_and_configs = function(dap)
  require("settings.dap.languages.bash").setup(dap)
  require("settings.dap.languages.go").setup(dap)
  require("settings.dap.languages.js").setup(dap)
  require("settings.dap.languages.dart").setup(dap)
  require("settings.dap.languages.python").setup(dap)
  require("settings.dap.languages.rust").setup(dap)
end

return M
