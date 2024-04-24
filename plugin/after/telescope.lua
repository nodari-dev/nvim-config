local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})

require('telescope').setup {
	defaults = {
		layout_strategy = 'vertical',
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		}
	},
}
