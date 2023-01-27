vim.g.mapleader = " "
local keymap = vim.keymap
local opt = { silent = true, noremap = true }

-- INFO: normal mode key maps
keymap.set("n", "<A-r>", "<cmd>lua ReloadConfig()<cr>", opt)
keymap.set("n", "<C-Esc>", "<cmd>wqa<cr>", opt)
keymap.set("n", "<C-A-Esc>", "<cmd>qa!<cr>", opt)
keymap.set("n", "<C-s>", "<cmd>wa<cr>", opt)
keymap.set("n", "<C-a>", "gg<S-v>G", opt)
keymap.set("n", "<C-z>", "u", opt)
keymap.set("n", "<C-S-z>", "<C-r>", opt)
keymap.set("n", "<leader>s", "<cmd>:vsplit<Return><C-w>w", opt)
keymap.set("n", "<A-f>", "<C-w>w", opt)
keymap.set("n", "H", "^", opt)
keymap.set("n", "L", "$", opt)
keymap.set("n", "<leader>m", "<cmd>:Telescope file_browser<cr>", opt)

-- INFO: insert mode key maps
keymap.set("i", "<C-s>", "<cmd>wa<cr>", opt)
keymap.set("i", "<C-S-Left>", "^[<v>", opt)

-- INFO: visual mode key maps
keymap.set("v", "<C-c>", "y", opt)
keymap.set("v", "<C-c>", "y<Esc>")
keymap.set("v", "<C-x>", "d<Esc>")
keymap.set("v", "<C-v>", "pi")
