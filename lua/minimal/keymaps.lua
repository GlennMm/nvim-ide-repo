vim.g.mapleader = " "
local keymap = vim.keymap
local opt = { silent = true, noremap = true }

keymap.set("n", "<A-r>", "<cmd>lua ReloadConfig()<cr>", opt)

keymap.set("n", "<C-Esc>", "<cmd>wqa<cr>", opt)
keymap.set("n", "<C-A-Esc>", "<cmd>qa!<cr>", opt)
keymap.set("n", "<C-s>", "<cmd>wa<cr>", opt)
keymap.set("i", "<C-s>", "<cmd>wa<cr>", opt)
keymap.set("n", "<C-c>", "", opt)
keymap.set("n", "<C-a>", "gg<S-v>G", opt)
keymap.set("n", "<leader>s", "<cmd>:vsplit<Return><C-w>w", opt)
keymap.set("n", "<A-f>", "<C-w>w", opt)
keymap.set("n", "H", "^", opt)
keymap.set("n", "L", "$", opt)

keymap.set("n", "<leader>fb", ":Telescope file_browser", opt)
