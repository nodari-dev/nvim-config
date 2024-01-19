local sidebar = require("sidebar-nvim")
local opts = {
	open = true,
	sections = { "git", "diagnostics" },
	initial_width = 40,
}
sidebar.setup(opts)
