local oky, builtins = pcall(require, "telescope.builtin")
if not oky then
  return
end
local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

local telescope = require("telescope")
telescope.load_extension("noice")
telescope.load_extension("file_browser")
telescope.load_extension("goimpl")
telescope.setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,i
    path_display = { "smart" },
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<C-j>"] = actions.preview_scrolling_up,
        ["<C-k>"] = actions.preview_scrolling_down,
        ["<esc>"] = actions.close,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<Right>"] = actions.cycle_history_prev,
        ["<Left>"] = actions.cycle_history_next,
      },
    },
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6,
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    picker_config_key = value,
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- remap to going to home directory
          ["<C-h>"] = fb_actions.goto_home_dir,
          ["<C-x>"] = function(prompt_bufnr)
            -- your custom function
          end,
        },
        ["n"] = {
          -- unmap toggling `fb_actions.toggle_browser`
          f = false,
        },
      },
    },
  },
})

local map = vim.keymap
local opt = { silent = true, noremap = true }

map.set("n", "<leader>f", builtins.find_files, opt)
map.set("n", "<leader><leader>", builtins.oldfiles, opt)
map.set("n", "<leader>fg", builtins.live_grep, opt)
map.set("n", "<leader>fh", builtins.help_tags, opt)
map.set("n", "<leader>fb", ":Telescope file_browser<cr>", opt)
