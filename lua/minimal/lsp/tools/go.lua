local M = {}

local oky, tools = pcall(require, "go")
if not oky then
  vim.notify("Failed to load go tools", vim.log.levels.WARN)
  return
end

local icons = require("minimal.icons")
local lsp_opt = require("minimal.lsp.lsp-opts")

M.setup = function()
  tools.setup({
    disable_defaults = false,
    go = "go",
    goimport = "gopls",
    fillstruct = "gopls",
    gofmt = "gofumpt",
    max_line_len = 120,
    tag_transform = false,
    tag_options = "json=omitempty",
    gotests_template = "",
    gotests_template_dir = "",
    comment_placeholder = "",
    icons = { breakpoint = icons.ui.Bug, currentpos = icons.ui.Fire },
    verbose = false,
    lsp_cfg = lsp_opt.capabilities,
    lsp_gofumpt = true,
    lsp_on_attach = lsp_opt.on_attach,
    lsp_keymaps = true,
    lsp_codelens = true,
    lsp_diag_hdlr = true,
    lsp_diag_underline = true,
    lsp_diag_virtual_text = { space = 0, prefix = "" },
    lsp_diag_signs = true,
    lsp_diag_update_in_insert = false,
    lsp_document_formatting = true,
    lsp_inlay_hints = {
      enable = true,
      only_current_line = false,
      only_current_line_autocmd = "CursorHold",
      show_variable_name = true,
      parameter_hints_prefix = " ",
      show_parameter_hints = true,
      other_hints_prefix = " ",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 6,
      highlight = "Comment",
    },
    gopls_cmd = nil,
    gopls_remote_auto = true,
    gocoverage_sign = "█",
    sign_priority = 5,
    dap_debug = true,
    dap_debug_keymap = true,
    dap_debug_gui = true,
    dap_debug_vt = true,
    dap_port = 38697,
    dap_timeout = 15,
    dap_retries = 20,
    build_tags = "tag1,tag2",
    textobjects = true,
    test_runner = "go",
    verbose_tests = true,
    run_in_floaterm = false,
    trouble = false,
    test_efm = false,
    luasnip = true,
  })
end

return M
