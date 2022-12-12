local servers = {
	"sumneko_lua",
	"tailwindcss",
	"html",
	"volar",
	"prismals",
	"rust_analyzer",
	"gopls",
	"tsserver",
	"taplo",
	"jsonls",
	"yamlls",
  "zk",
  "denols"
}
local util = require("lspconfig/util")
local icons = require("text_editor.icons")
local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("ide.lsp.handlers").on_attach,
		capabilities = require("ide.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "ide.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	if server == "tsserver" then
		lspconfig.tsserver.setup({
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
		})
	end

	if server == "ide_analyzer" then
		require("ide-tools").setup({
			server = {
				on_attach = require("ide.lsp.handlers").on_attach,
				capabilities = require("ide.lsp.handlers").capabilities,
			},
			dap = {
				adapter = {
					type = "executable",
					command = "lldb-vscode",
					name = "rt_lldb",
				},
			},
		})
		goto continue
	end

	if server == "gopls" then
		lspconfig.gopls.setup({
			cmd = { "gopls", "serve" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
						unreachable = true,
						copylocks = true,
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					codelenses = {
						gc_details = true,
						generate = true,
						regenerate_cgo = true,
						tidy = true,
						test = true,
						upgrade_depenedecy = true,
						run_govulncheck = true,
						vendor = true,
						run = true,
						debug = true,
					},
				},
			},
		})
		require("go").setup({
			lsp_cfg = {
				capabilities = opts.capabilities,
				on_attach = opts.on_attach,
			},
			lsp_codelens = true,
			tag_options = "json=omitempty",
			comment_placeholder = icons.kind.Misc,
			icons = { breakpoint = icons.ui.Bug, currentpos = icons.documents.OpenFolder },
			dap_debug = true,
			dap_debug_gui = true,
		})
		vim.cmd("autocmd FileType go nmap <Leader><Leader>gl GoLint")
		vim.cmd("autocmd FileType go nmap <Leader>gc :lua require('go.comment').gen()")
		require("guihua.maps").setup({
			maps = {
				close_view = "<C-x>",
			},
		})
		goto continue
	end

	lspconfig[server].setup(opts)
	::continue::
end
