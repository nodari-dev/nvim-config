vim.g.barbar_auto_setup = false
local map = vim.api.nvim_set_keymap
local opts = {
	noremap = true,
	silent = true,
}

map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<C-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<C-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<C-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<C-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<C-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<C-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<C-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<C-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<C-e>', '<Cmd>BufferClose<CR>', opts)


require 'barbar'.setup {
	icons = {
		filetype = {
			custom_colors = false,
			enabled = false
		},
		separator = { left = '▎', right = '' },

		separator_at_end = true,

		button = ""
	}
}
