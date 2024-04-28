vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = args.buf })
    vim.keymap.set('n', '<C-s>', vim.lsp.buf.code_action, { buffer = args.buf })
    vim.keymap.set('n', '<leader>vr', vim.lsp.buf.references, { buffer = args.buf })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
  end,
})


local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")
local lsp_capabilities = vim.tbl_deep_extend(
	"force",
	{},
	vim.lsp.protocol.make_client_capabilities(),
	cmp_lsp.default_capabilities())

local lspconfig = require("lspconfig")

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
	},
	handlers = {
		function (server_name)
			lspconfig[server_name].setup {
			capabilities = lsp_capabilities
			}
		end,
		["lua_ls"] = function()
			lspconfig.lua_ls.setup {
				capabilities = lsp_capabilities,
				settings = {
					Lua = {
					runtime = { version = "Lua 5.1" },
						diagnostics = {
							globals = { "vim", "it", "describe", "before_each", "after_each" },
						}
					}
				}
			}
		end,
		["clangd"] = function()
			lspconfig.clangd.setup {
				capabilities = lsp_capabilities,
			}
	end
	}
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-j>'] = cmp.mapping.confirm({ select = true })
	}),

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
		{ name = 'buffer' },
	}),

	vim.diagnostic.config({
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}),
})
