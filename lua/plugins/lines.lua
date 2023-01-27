return {
  "tamton-aquib/staline.nvim",
  config = function()
    local staline = require("staline")
    local conf = {
      defaults = {
        expand_null_ls = true, -- This expands out all the null-ls sources to be shown
        cool_symbol = "  ",
        left_separator = "",
        right_separator = "",
        full_path = false,
        line_column = " 並%p%% ", -- `:h stl` to see all flags.

        -- fg = "#000000", -- Foreground text color.
        bg = "none", -- Default background is transparent.
        inactive_color = "#303030",
        inactive_bgcolor = "none",
        true_colors = false, -- true lsp colors.
        font_active = "bold,italic", -- "bold", "italic", "bold,italic", etc

        mod_symbol = "  ",
        lsp_client_symbol = "  ",
        branch_symbol = " ",
        -- cool_symbol = " ", -- Change this to override default OS icon.
        null_ls_symbol = "", -- A symbol to indicate that a source is coming from null-ls
      },
      -- mode_colors = {
      --   n = "#2bbb4f",
      --   i = "#986fec",
      --   c = "#e27d60",
      --   v = "#4799eb", -- etc..
      -- },
      mode_colors = {
        i = "#d4be98",
        n = "#84a598",
        c = "#8fbf7f",
        v = "#fc802d",
      },
      mode_icons = {
        n = " ",
        i = " ",
        c = " ",
        v = " ", -- etc..
      },
      sections = {
        left = { "- ", "-mode", "left_sep_double", " ", "branch" },
        mid = { "file_name" },
        right = {
          "cool_symbol",
          "lsp",
          "lsp_name",
          "right_sep_double",
          "-line_column",
        },
      },
      special_table = {
        NvimTree = { "NvimTree", " " },
        packer = { "Packer", " " }, -- etc
        lazy = { "Lazy", " " }, -- etc
      },
      lsp_symbols = {
        Error = " ",
        Info = " ",
        Warn = " ",
        Hint = "",
      },
    }
    staline.setup(conf)
  end,
}
