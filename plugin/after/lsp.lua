local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	vim.keymap.set('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
	vim.keymap.set('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
	vim.keymap.set('n', '<C-Space>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	vim.keymap.set('n', '<leader>vr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver', 'kotlin_language_server', 'jdtls', 'clangd',
		'cssls', 'html', 'jsonls', 'lua_ls', 'templ',
		'tsserver', 'vimls'
	},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end
	}
})

