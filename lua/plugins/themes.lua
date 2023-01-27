return {
  "folke/tokyonight.nvim",
  "folke/lsp-colors.nvim",
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      require("bluloco").setup({
        style = "dark", -- "auto" | "dark" | "light"
        transparent = false,
        italics = true,
        terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
      })

      vim.cmd("colorscheme bluloco")
    end,
  },
}
