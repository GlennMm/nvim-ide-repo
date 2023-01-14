local icons = require("minimal.icons")

return {
  "akinsho/bufferline.nvim",
  varsion = "v3.*",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    local ok, bufferline = pcall(require, "bufferline")
    if not ok then
      vim.notify("Failed to load bufferline.", vim.log.levels.WARN)
      return
    end
    bufferline.setup({
      options = {
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = { icon = "│" },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 21,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        offsets = { { filetype = "NvimTree", text = "Explorer", padding = 1 } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
      },
    })
  end,
}
