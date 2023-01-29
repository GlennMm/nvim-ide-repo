local M = {}

M.setup = function(dap)
  dap.adapters.dart = {
    type = "executable",
    command = "node",
    args = { vim.fn.stdpath("data") .. "/mason/packages/dart-debug-adapter/extension/out/dist/debug.js", "flutter" },
  }
  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch flutter",
      dartSdkPath = os.getenv("HOME") .. "/software/flutter/bin/cache/dart-sdk/",
      flutterSdkPath = os.getenv("HOME") .. "/flutter",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
    },
  }
end

return M
