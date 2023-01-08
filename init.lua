local keymap = vim.keymap
keymap.set("n", "<A-r>", "<cmd>lua ReloadConfig()<cr>")

require("reload")

-- require("text_editor")
-- require("ide")
require("minimal")

vim.notify_once("Welcome NeoVim IDE. \nHappy Coding.")
