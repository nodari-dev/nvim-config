local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  vim.keymap.set('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  vim.keymap.set('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts) 
  vim.keymap.set('n', '<C-Space>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'tsserver'},
  handlers = {
    lsp.default_setup,
  }
})
require('lspconfig').lua_ls.setup({})

