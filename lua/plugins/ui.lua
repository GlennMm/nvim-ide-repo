return {
  "j-hui/fidget.nvim",
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
  },
  {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    -- config = true,
    config = function()
      local possession = require("nvim-possession")
      possession.setup {
        sessions = {
          sessions_path = vim.fn.stdpath("data") .. "/sessions/", -- folder to look for sessions, must be a valid existing path
          sessions_variable = 'session', -- defines vim.g[sessions_variable] when a session is loaded
          sessions_icon = " "
        },
        autoload = false, -- whether to autoload sessions in the cwd at startup
        autosave = true, -- whether to autosave loaded sessions before quitting
        autoswitch = {
          enable = true, -- whether to enable autoswitch
          exclude_ft = {}, -- list of filetypes to exclude from autoswitch
        },
        post_hook = nil, -- callback, function to execute after loading a session
        -- useful to restore file trees, file managers or terminals
        -- function()
        --     require('FTerm').open()
        --     require('nvim-tree').toggle(false, true)
        -- end
        fzf_winopts = {
          -- any valid fzf-lua winopts options, for instance
          width = 0.5,
          preview = {
            vertical = "right:30%"
          }
        }
      }
      vim.keymap.set("n", "<leader>sl", function()
        possession.list()
      end)
      vim.keymap.set("n", "<leader>sn", function()
        possession.new()
      end)
      vim.keymap.set("n", "<leader>su", function()
        possession.update()
      end)
    end,
  },
  "nvim-lualine/lualine.nvim",
  "folke/tokyonight.nvim",
  "folke/lsp-colors.nvim",
  "navarasu/onedark.nvim",
  "LunarVim/onedarker.nvim",
  "gbprod/nord.nvim",
  'JoosepAlviste/palenightfall.nvim',
  'RaafatTurki/hex.nvim',
  'ellisonleao/gruvbox.nvim',
  'savq/melange-nvim'
}
