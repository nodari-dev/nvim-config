require("trouble").setup({
	icons = false
})

vim.keymap.set("n", "<leader>tt", function()
	require("trouble").toggle()
end)

