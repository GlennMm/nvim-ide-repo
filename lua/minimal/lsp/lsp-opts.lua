M = {}

local not_oky, navic = pcall(require, "nvim-navic")
if not not_oky then
  vim.notify("navic failed to load. lsp might not work", vim.log.levels.ERROR)
  return
end

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
--
M.on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", bufopts)
  -- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", bufopts)
  -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<cr>", bufopts)
  -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  -- vim.keymap.set("n", "<leader>d", "<cmd>Telescope lsp_document_symbols<cr>", bufopts)
  --
  -- Code action groups

  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ sync = true })
    end,
  })

  vim.g.navic_silence = false -- can be set to true to suppress error
  local symbols_supported = client.supports_method("textDocument/documentSymbol")
  if symbols_supported then
    navic.attach(client, bufnr)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
