local oky, lualine = pcall(require, "lualine")
if not oky then
  return
end

local icons = require("utils.icons")

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

local mode = {
  function()
    -- return "▊"
    return "   "
    -- return "  "
  end,
  padding = 0,
}

local lanuage_server = {
  function()
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
      if M.language_servers == nil then
        return ""
      else
        return M.language_servers
      end
    end

    local clients = vim.lsp.buf_get_clients()
    local client_names = {}
    local copilot_active = true

    -- add client
    for _, client in pairs(clients) do
      if client.name ~= "copilot" and client.name ~= "null-ls" then
        table.insert(client_names, client.name)
      end
      if client.name == "copilot" then
        copilot_active = true
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

    -- join client names with commas
    local client_names_str = table.concat(client_names, ", ")

    -- check client_names_str if empty
    local language_servers = ""
    local client_names_str_len = #client_names_str
    if client_names_str_len ~= 0 then
      language_servers = client_names_str .. " "
    end
    if copilot_active then
      language_servers = " " .. icons.git.Octoface .. " " .. language_servers
    end

    if client_names_str_len == 0 and not copilot_active then
      return ""
    else
      M.language_servers = language_servers
      return language_servers:gsub(", anonymous source", "")
    end
  end,
  padding = 0,
  cond = hide_in_width,
  -- separator = "%#SLSeparator#" .. " │" .. "%*",
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      mode,
    },
    lualine_b = { "branch", "diff", { "filename", path = 0 } },
    lualine_c = {
      -- { "filename", path = 0 },
    },
    lualine_x = { "diagnostics", lanuage_server, "filetype" },
    lualine_y = {},
    lualine_z = {
      "encoding",
      "fileformat",
    },
  },
})
