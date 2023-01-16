local excludes = {
  "packer",
  "NvimTree",
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "spectre_panel",
  "toggleterm",
}

local gray = "#32363e"
local dark_gray = "#282C34"
local dark_gray = "#282C34"
local red = "#D16969"
local blue = "#569CD6"
local green = "#6A9955"
local cyan = "#4EC9B0"
local orange = "#CE9178"
local indent = "#CE9178"
local yellow = "#DCDCAA"
local yellow_orange = "#D7BA7D"
local purple = "#C586C0"

local winbar = require("minimal.winbar")

local mode_color = {
  n = blue,
  i = orange,
  v = "#b668cd",
  [""] = "#b668cd",
  V = "#b668cd",
  -- c = '#B5CEA8',
  -- c = '#D7BA7D',
  c = "#46a6b2",
  no = "#D16D9E",
  s = green,
  S = orange,
  [""] = orange,
  ic = red,
  R = "#D16D9E",
  Rv = red,
  cv = blue,
  ce = blue,
  r = red,
  rm = "#46a6b2",
  ["r?"] = "#46a6b2",
  ["!"] = "#46a6b2",
  t = red,
}

-- check if value in table
local function contains(t, value)
  for _, v in pairs(t) do
    if v == value then
      return true
    end
  end
  return false
end

local hide_in_width = function()
  return vim.o.columns > 80
end
-- components
local mode = {
  function()
    -- return "▊"
    return "  "
    -- return "  "
  end,
  color = function()
    return { fg = mode_color[vim.fn.mode()], bg = gray }
  end,
  padding = 0,
}

-- language servers
local lanuage_server = {
  function()
    local language_servers = ""
    local buf_ft = vim.bo.filetype
    local ui_filetypes = {
      "help",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
      "lspinfo",
      "lsp-installer",
      "",
    }

    if contains(ui_filetypes, buf_ft) then
      if language_servers == nil then
        return ""
      else
        return language_servers
      end
    end

    local clients = vim.lsp.buf_get_clients()
    local client_names = {}

    -- add client
    for _, client in pairs(clients) do
      if client.name ~= "copilot" and client.name ~= "null-ls" then
        table.insert(client_names, client.name)
      end
    end

    -- add formatter
    local s = require("null-ls.sources")
    local available_sources = s.get_available(buf_ft)
    local registered = {}
    for _, source in ipairs(available_sources) do
      for method in pairs(source.methods) do
        registered[method] = registered[method] or {}
        table.insert(registered[method], source.name)
      end
    end

    local formatter = registered["NULL_LS_FORMATTING"]
    local linter = registered["NULL_LS_DIAGNOSTICS"]
    if formatter ~= nil then
      vim.list_extend(client_names, formatter)
    end
    if linter ~= nil then
      vim.list_extend(client_names, linter)
    end

    local client_names_str = table.concat(client_names, ", ")

    local client_names_str_len = #client_names_str
    if client_names_str_len ~= 0 then
      language_servers = client_names_str
    end
    -- if copilot_active then
    --   language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.git.Octoface .. "%*"
    -- end

    if client_names_str_len == 0 then
      return ""
    else
      language_servers = language_servers
      return language_servers:gsub(", anonymous source", "")
    end
  end,
  padding = 1,
  cond = hide_in_width,
  -- separator = "%#SLSeparator#" .. " │" .. "%*",
}

local config = {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = excludes,
      winbar = excludes,
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
      mode,
    },
    lualine_b = { { "filename", path = 0 }, "branch" },
    lualine_c = { "lsp_progress" },
    lualine_x = {},
    lualine_y = { lanuage_server, "diagnostics", "filetype" },
    lualine_z = {
      { "progress", separator = { right = "" } },
    },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        "location",
        color = function()
          return { fg = mode_color[vim.fn.mode()], bg = gray }
        end,
      },
    },
  },
  tabline = {},
  winbar = {
    lualine_c = { winbar.get_winbar },
  },
  inactive_winbar = {},
  extensions = {},
}

require("lualine").setup(config)
