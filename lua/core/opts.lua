local opt = vim.opt
local cmd = vim.cmd
local filetype = vim.filetype
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

opt.backspace = "2"
opt.laststatus = 2
opt.shiftround = true
opt.number = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.scrolloff = 5
opt.hlsearch = true
opt.incsearch = true
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.swapfile = false
opt.autoread = true
opt.list = true
opt.showcmd = false
opt.linebreak = true
opt.cmdheight = 1
opt.updatetime = 100
opt.shortmess:append("a")
opt.splitkeep = "screen"
-- opt.shortmess = "filnxtToOFWIcC"
opt.winblend = 0
opt.background = "dark"
opt.backup = false
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 0
opt.si = true
opt.ai = true
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 1000
opt.undofile = true
opt.writebackup = false
opt.shiftwidth = 2
opt.cursorline = true
opt.number = true
opt.ruler = false
opt.relativenumber = true
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.sidescrolloff = 8
opt.guifont = "monospace:h17"
opt.title = true
opt.fillchars = opt.fillchars + "eob: "
opt.fillchars:append({
  stl = " ",
})

vim.scriptencoding = "utf-8"

cmd("set whichwrap+=<,>,[,],h,l")
cmd([[set iskeyword+=-]])
filetype.add({
  extension = {
    conf = "dosini",
  },
})
