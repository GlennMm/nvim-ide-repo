local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.load_extension("file_browser")
telescope.load_extension("dap")
telescope.load_extension("notify")
telescope.load_extension("ui-select")
telescope.load_extension("project")
telescope.load_extension("flutter")

telescope.setup({
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },

		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<Up>"] = actions.cycle_history_prev,
				["<Down>"] = actions.cycle_history_next,
			},
		},
	},
})
