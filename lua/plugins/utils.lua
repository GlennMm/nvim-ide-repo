return {
  "numToStr/Comment.nvim",
  "akinsho/toggleterm.nvim",
  "folke/which-key.nvim",
  "axelvc/template-string.nvim",
  "windwp/nvim-autopairs",
  "gcmt/wildfire.vim",
  "tpope/vim-surround",
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "JoosepAlviste/nvim-ts-context-commentstring",
  "windwp/nvim-ts-autotag",
  "AmeerTaweel/todo.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly",
  },
  {
    "goolord/alpha-nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "roobert/surround-ui.nvim",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    config = function()
      require("surround-ui").setup({
        root_key = "S"
      })
    end,
  },
}
