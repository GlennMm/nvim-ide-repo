local M = {}

local oky, tools = pcall(require, "rust-tools")
if not oky then
  vim.notify("Failed to load rust tools", vim.log.levels.WARN)
  return
end

local lsp_opt = require("settings.lsp.utils")

M.setup = function()
  local opts = {
    tools = {
      executor = require("rust-tools.executors").termopen,
      on_initialized = function()
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
          pattern = { "*.rs" },
          callback = function()
            vim.lsp.codelens.refresh()
          end,
        })
      end,
      reload_workspace_from_cargo_toml = true,
      runnables = {
        use_telescope = true,
      },
      inlay_hints = {
        auto = true,
        only_current_line = false,
        show_parameter_hints = true,
        parameter_hints_prefix = " ",
        other_hints_prefix = " ",
      },
    },
    server = {
      standalone = true,
      on_attach = lsp_opt.on_attach,
      capabilities = lsp_opt.capabilities,
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            enable = true,
            experimentals = { enable = true },
          },
          lens = {
            enable = true,
            debug = { enable = true },
            run = { enable = true },
            implementations = { enable = true },
            location = "above_name",
            references = {
              adt = {
                enable = true,
              },
              enumVariant = {
                enable = true,
              },
              method = { enable = true },
              trait = { enable = true },
            },
          },
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    },
    dap = {
      adapter = {
        type = "executable",
        command = "lldb-vscode",
        name = "rt_lldb",
      },
    },
  }

  tools.setup(opts)
end

return M
