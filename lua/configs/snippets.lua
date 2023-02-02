local ok, ls = pcall(require, "luasnip")
if not ok then
  vim.notify("Failed to load luasnip", vim.log.levels.WARN)
  return
end

local types = require("luasnip.util.types")

ls.setup({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "●", "GruvboxOrange" } },
      },
    },
    [types.insertNode] = {
      active = {
        virt_text = { { "●", "GruvboxBlue" } },
      },
    },
  },
})

ls.snippets = {}
