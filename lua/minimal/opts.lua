local opt = vim.opt
local api = vim.api
local cmd = vim.cmd
local filetype = vim.filetype
local bo = vim.bo
local highlight = vim.highlight

opt.number = true
opt.relativenumber = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.hlsearch = true
opt.incsearch = true
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.swapfile = false
opt.autoread = true
opt.signcolumn = "yes"
opt.list = true
opt.cursorline = true
opt.wrap = true
opt.showcmd = false
opt.undofile = true
opt.linebreak = true
opt.cmdheight = 1
opt.updatetime = 100
opt.shortmess:append("a")
opt.backup = false
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 0
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 1000
opt.undofile = true
opt.writebackup = false
opt.shiftwidth = 2
opt.tabstop = 2
opt.cursorline = true
opt.number = true
opt.laststatus = 3
opt.ruler = false
opt.relativenumber = false
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
bo.autoread = true

api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		highlight.on_yank({
			higroup = "IncSearch",
			timeout = 300,
		})
	end,
})

cmd("set whichwrap+=<,>,[,],h,l")
cmd([[set iskeyword+=-]])
filetype.add({
	extension = {
		conf = "dosini",
	},
})
