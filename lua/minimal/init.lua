local ok, notify = pcall(require, "notify")
if not ok then
  goto cont
end

notify.setup({
  background_colour = "#000000",
  render = 'minimal'
})
vim.notify = notify

::cont::
require("minimal.keymaps")
require("minimal.opts")
require("minimal.plugins")
require("minimal.colorscheme")
require("minimal.p-alpha")
require("minimal.p-navic")
require("minimal.p-nvim-tree")
require("minimal.p-lualine")
require("minimal.p-text")
require("minimal.p-telescope")
require("minimal.p-cmp")
require("minimal.p-null")
require("minimal.p-luasnip")
require("minimal.p-autopairs")
require("minimal.p-treesitter")
require("minimal.p-noice")
require("minimal.p-which-key")
require("minimal.p-ufo")
require("minimal.p-toggle-term")
require("minimal.lsp")
require("minimal.style")
require("minimal.other")
require("minimal.autocmds")
