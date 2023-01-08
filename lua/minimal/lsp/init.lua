require("mason").setup()
local oky, lspconfig = pcall(require, "lspconfig")
if not oky then
  vim.notify("Failed to load lsp config plugin.", "error")
  return
end
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

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

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", '<cmd>Telescope lsp_definitions<cr>', bufopts)
  vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", '<cmd>Telescope lsp_implementations<cr>', bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>D", '<cmd>Telescope lsp_type_definitions<cr>', bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>d", '<cmd>Telescope lsp_document_symbols<cr>', bufopts)

  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
    buffer = bufnr,
    callback = function()
           vim.lsp.buf.format({ sync = true })
    end,
  })
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "minimal.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
