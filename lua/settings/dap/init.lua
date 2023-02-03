local map = vim.keymap.set
local sign_define = vim.fn.sign_define
local opt = { silent = true, noremap = true }
local oky, dap = pcall(require, "dap")
if not oky then
  return
end
local ok, dapui = pcall(require, "dapui")
if not ok then
  return
end

require("settings.dap.ui")
require("settings.dap.languages").setup_adapter_and_configs(dap)
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local dap_breakpoint = {
  error = {
    text = "🟥",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
  rejected = {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
  },
  stopped = {
    text = "⭐️",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  },
}

sign_define("DapBreakpoint", dap_breakpoint.error)
sign_define("DapStopped", dap_breakpoint.stopped)
sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

map("n", "<F8>", ":lua require'dap'.toggle_breakpoint()<cr>", opt)
map("n", "<F5>", ":lua require'dap'.continue()<cr>", opt)
map("n", "<F9>", ":lua require'dap'.step_into()<cr>", opt)
map("n", "<F10>", ":lua require'dap'.step_over()<cr>", opt)
map("n", "<F12>", ":lua require'dapui'.toggle()<cr>", opt)
