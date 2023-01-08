require("mason").setup()

local oky, lspconfig = pcall(require, "lspconfig")
if not oky then
  vim.notify("Failed to load lsp config plugin.", "error")
  return
end

local lsp_opts = require("minimal.lsp.lsp-opts")

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
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = lsp_opts.on_attach,
    capabilities = lsp_opts.capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "minimal.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  if server == "gopls" then
    print('going...')
    -- require("minimal.lsp.tools.go").setup()
  end

  if server == "tsserver" then
    print('ts-server...')
    -- require("minimal.lsp.tools.ts").setup()
  end

  if server == "rust_analyzer" then
    print('rust-analyzing...')
    -- require("minimal.lsp.tools.rust").setup()
  end

  lspconfig[server].setup(opts)
end
