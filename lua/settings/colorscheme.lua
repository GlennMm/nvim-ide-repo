-- local theme = "palenightfall"
local theme = "melange"
if theme == "onedark" then
  local onedark = require("onedark")
  onedark.setup({
    style = "darker",
    italics = true,
    cmp_itemkind_reverse = true,
    code_style = {
      comments = "italic",
      keywords = "italic",
      functions = "italic",
      strings = "none",
      variables = "none",
    },
  })
  onedark.load()
end

vim.cmd("colorscheme " .. theme)
