require('lualine').setup {
  options = {
    theme = 'auto',
	icons_enabled = false,
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
	lualine_c = {
		{
		  'filename',
		  file_status = true,
		  newfile_status = false,
		  path = 2
		}
	},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
  },
  inactive_sections = {
    lualine_c = {},
    lualine_x = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
