local M = {}

local oky, tools = pcall(require, "ts")
if not oky then
  vim.notify("Failed to load typescript tools", vim.log.levels.WARN)
  return
end

M.setup = function ()
  tools.setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
    },
    server = { -- pass options to lspconfig's setup method
        on_attach = require('minimal.lsp.lsp-opts').on_attach,
    },
})
end



return M
