local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
    --TODO Code formatting
		formatting.stylua,
    formatting.eslint,
		-- formatting.gofmt,
		-- formatting.goimports,
		-- formatting.prettier,
		-- formatting.rustfmt,
		-- formatting.rustywind,
		-- formatting.prismaFmt,

    -- Code code_actions 
    -- code_actions.eslint,
    -- code_actions.gomodifytags,
    -- code_actions.ltrs,
    --
    -- diagnostics 
    -- diagnostics.eslint,
    -- diagnostics.golangci_lint,
    -- diagnostics.ltrs,
    -- diagnostics.tsc,
	},
})
