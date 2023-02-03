require("mason").setup()

local oky, lspconfig = pcall(require, "lspconfig")
if not oky then
  vim.notify("Failed to load lsp config plugin.", "error")
  return
end

local lsp_opts = require("settings.lsp.utils")

local servers = {
  "sumneko_lua",
  --  "tailwindcss",
  "html",
  "prismals",
  "rust_analyzer",
  "gopls",
  "tsserver",
  "taplo",
  "jsonls",
  "prismals",
  "bashls",
  "zk",
  "pyright",
  "jedi_language_server",
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})
-- require("settings.lsp.nullls")
require("settings.lsp.saga")
require("settings.dap")

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = lsp_opts.on_attach,
    capabilities = lsp_opts.capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "settings.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  if server == "rust_analyzer" then
    require("settings.lsp.tools.rust").setup()
    goto cont
  end

  if server == "gopls" then
    require("settings.lsp.tools.go").setup()
    goto cont
  end

  if server == "tsserver" then
    -- require("settings.lsp.tools.ts").setup()
    require("settings.lsp.tools.npm").setup()
    goto cont
  end

  lspconfig[server].setup(opts)
  ::cont::
end

require("settings.lsp.tools.flutter").setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = true, -- This sets the spacing and the prefix, obviously.
  virtual_text = false,
})
