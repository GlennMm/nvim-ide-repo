require("mason").setup()

local oky, lspconfig = pcall(require, "lspconfig")
if not oky then
  vim.notify("Failed to load lsp config plugin.", "error")
  return
end

local lsp_opts = require("new.configs/lsp/utils")

local servers = {
  "sumneko_lua",
  "tailwindcss",
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
require("new.configs.lsp.nullls")
require("new.configs.lsp.saga")
require("new.configs.dap")

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = lsp_opts.on_attach,
    capabilities = lsp_opts.capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "new.configs.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  if server == "rust_analyzer" then
    require("new.configs.lsp.tools.rust").setup()
    goto cont
  end

  if server == "gopls" then
    require("new.configs.lsp.tools.go").setup()
    goto cont
  end

  if server == "tsserver" then
    require("new.configs.lsp.tools.ts").setup()
    require("new.configs.lsp.tools.npm").setup()
    goto cont
  end

  lspconfig[server].setup(opts)
  ::cont::
end

require("new.configs.lsp.tools.flutter").setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = true, -- This sets the spacing and the prefix, obviously.
  virtual_text = false,
})
