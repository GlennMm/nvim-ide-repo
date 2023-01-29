return {
  {
    "nvim-telescope/telescope.nvim",
  },
  {
    "edolphin-ydf/goimpl.nvim",
    dependecies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-dap.nvim",
}
