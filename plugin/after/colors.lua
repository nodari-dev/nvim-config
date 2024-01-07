function Theme(color)
	color = color or "fleet"
	vim.cmd.colorscheme(color)
end
Theme()
