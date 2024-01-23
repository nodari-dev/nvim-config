local sidebar = require("sidebar-nvim")
local opts = {
	open = true,
	sections = { "git", "diagnostics" },
	initial_width = 40,
	update_interval = 100,
	git = {
		icon = ">",
	},
	diagnostics = {
		icon = ">"
	}
}
sidebar.setup(opts)
