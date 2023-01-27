return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>f", builtin.find_files, {})
      vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      telescope.load_extension("noice")
      telescope.load_extension("file_browser")

      require("nvim-web-devicons").setup({
        override = {},
        dafeult = false,
      })
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
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-n>"] = actions.cycle_history_next,
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
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
        },
        extensions = {
          -- Your extension configuration goes here:
          -- extension_name = {
          --   extension_config_key = value,
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
    end,
  },
  {
    "edolphin-ydf/goimpl.nvim",
    dependecies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("telescope").load_extension("goimpl")
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-dap.nvim",
}
