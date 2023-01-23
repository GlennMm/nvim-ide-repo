return {
	"nvim-lua/plenary.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"windwp/nvim-autopairs",
	"mg979/vim-visual-multi",
	"gcmt/wildfire.vim",
	"tpope/vim-surround",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"jose-elias-alvarez/null-ls.nvim",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"JoosepAlviste/nvim-ts-context-commentstring",
	"windwp/nvim-ts-autotag",
	"axelvc/template-string.nvim",
	"j-hui/fidget.nvim",
	-- "folke/todo-comments.nvim",
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	"numToStr/Comment.nvim",
	"tjdevries/colorbuddy.vim",
	"akinsho/toggleterm.nvim",
	"folke/which-key.nvim",
	-- {  },
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
	},
	"ray-x/go.nvim",
	"ray-x/guihua.lua",
	"simrat39/rust-tools.nvim",
	"jose-elias-alvarez/typescript.nvim",
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
}
