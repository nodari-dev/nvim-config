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

-- default capabilities
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- html, css, etc.. capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver', 'kotlin_language_server', 'jdtls', 'clangd',
		'cssls', 'html', 'jsonls', 'lua_ls', 'sqlls',
		'postgres_lsp', 'yaml-language-server'
	},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
		lua_ls = function()
			require('lspconfig').lua_ls.setup({
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
		end,
		tsserver = function()
			require 'lspconfig'.tsserver.setup {}
		end,
		kotlin_language_server = function()
			require 'lspconfig'.kotlin_language_server.setup {}
		end,
		clangd = function()
			require 'lspconfig'.clangd.setup {}
		end,
		cssls = function()
			require 'lspconfig'.cssls.setup {
				capabilities = capabilities,
			}
		end,
		html = function()
			require 'lspconfig'.html.setup {
				capabilities = capabilities,
			}
		end,
		jsonls = function()
			require 'lspconfig'.jsonls.setup {
				capabilities = capabilities
			}
		end,
		sqlls = function()
			require'lspconfig'.sqlls.setup{}
		end,
		postgres_lsp = function()
			require'lspconfig'.postgres_lsp.setup{}
		end,
		yamlls = function()
			require'lspconfig'.yamlls.setup{}
		end
	}
})
