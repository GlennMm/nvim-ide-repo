require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "packer", "NvimTree" },
      winbar = { "packer", "NvimTree" },
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = { { "filename", path = 0 }, "branch" },
    lualine_c = { "" },
    lualine_x = {},
    lualine_y = { "diagnostics", "filetype" },
    lualine_z = {
      "progress",
    },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  tabline = {},
  winbar = { lualine_a = { "filename" } },
  inactive_winbar = {},
  extensions = {},
})
