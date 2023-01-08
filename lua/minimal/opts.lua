local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.hlsearch = true
opt.incsearch = true
opt.mouse = 'a'
opt.clipboard:append('unnamedplus')
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.swapfile = false
opt.autoread = true
opt.signcolumn = 'yes'
opt.list = true
opt.cursorline = true
opt.wrap = true
opt.showcmd = false
opt.undofile = true
opt.linebreak = true
opt.cmdheight = 1
opt.updatetime = 100

vim.scriptencoding = 'utf-8'
vim.bo.autoread = true

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300
    })
  end
})


local notify = require("notify")
notify.setup({
  background_colour = "#000000",
  render = 'minimal'
})
vim.notify = notify

