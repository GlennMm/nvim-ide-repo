local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("ide.lsp.mason")
require("ide.lsp.handlers").setup()
require("ide.lsp.null-ls")
