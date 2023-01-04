local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.load_extension("file_browser")
telescope.load_extension("dap")
telescope.load_extension("notify")
telescope.load_extension("ui-select")
telescope.load_extension("flutter")
telescope.load_extension("aerial")
telescope.load_extension('projects')

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
	aerial = {
		-- Display symbols as <root>.<parent>.<symbol>
		show_nesting = {
			["_"] = false, -- This key will be the default
			json = true, -- You can set the option for specific filetypes
			yaml = true,
		},
	},
})
