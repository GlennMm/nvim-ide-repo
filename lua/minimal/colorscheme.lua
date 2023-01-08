local theme = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. theme)
if not status_ok then
	vim.notify("colorscheme failed to load", vim.log.levels.WARN)
	return
end
