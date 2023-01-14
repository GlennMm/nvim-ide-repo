return {
  "nvim-lua/plenary.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  },
  "rmagatti/alternate-toggler",
  "windwp/nvim-autopairs",
  "mg979/vim-visual-multi",
  "gcmt/wildfire.vim",
  "tpope/vim-surround",
  "nvim-lualine/lualine.nvim",
  "nvim-telescope/telescope.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

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
  "folke/todo-comments.nvim",
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  "folke/tokyonight.nvim",

  "numToStr/Comment.nvim",
  "rcarriga/nvim-notify",
  "tjdevries/colorbuddy.vim",
  "akinsho/toggleterm.nvim",
  "folke/which-key.nvim",
  "folke/trouble.nvim",
  { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },

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
  "nvim-telescope/telescope-dap.nvim",
}
