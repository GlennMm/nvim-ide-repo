local lsp_utils = require("configs.lsp.utils")
local M = {}

M.setup = function()
  require("flutter-tools").setup({
    decorations = {
      statusline = {
        app_version = true,
        device = true,
      },
    },
    debugger = {
      enabled = true,
      run_via_dap = false,
      exception_breakpoints = {},
      register_configurations = function(paths)
        require("dap").configurations.dart = {
          -- <put here config that you would find in .vscode/launch.json>
        }
      end,
    },
    lsp = {
      color = { -- show the derived colours for dart variables
        enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
        background = false, -- highlight the background
        foreground = false, -- highlight the foreground
        virtual_text = true, -- show the highlight using virtual text
        virtual_text_str = "■", -- the virtual text character to highlight
      },
      on_attach = lsp_utils.on_attach,
      capabilities = lsp_utils.capabilities,
      settings = {
        showTodos = true,
        completeFunctionCalls = true,
        analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
        renameFilesWithClasses = "prompt", -- "always"
        enableSnippets = true,
      },
    },
  })
end

return M
