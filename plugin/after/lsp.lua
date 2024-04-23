local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	vim.keymap.set('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
	vim.keymap.set('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
	vim.keymap.set('n', '<C-Space>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	vim.keymap.set('n', '<leader>vr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end)

-- default capabilities
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- html, css, etc.. capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'kotlin_language_server',
		'jdtls',
		'clangd',
		'cssls',
		'html',
		'jsonls',
		'lua_ls',
		'sqlls',
		'yamlls',
		'graphql'
	}
})

require 'lspconfig'.kotlin_language_server.setup {}

require 'lspconfig'.cssls.setup {
	capabilities = capabilities,
}
require 'lspconfig'.jsonls.setup {
	capabilities = capabilities
}
require 'lspconfig'.html.setup {
	capabilities = capabilities,
}
require 'lspconfig'.clangd.setup {}
require 'lspconfig'.tsserver.setup {}
require 'lspconfig'.sqlls.setup {}
require 'lspconfig'.yamlls.setup {}
require 'lspconfig'.graphql.setup {}
require 'lspconfig'.lua_ls.setup({
	capabilities = lsp_capabilities,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT'
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
				}
			}
		}
	}
})
