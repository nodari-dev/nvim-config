require("carrotnvim")

vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.wo.relativenumber = true
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.cmd([[
  set cursorline
  highlight CursorLine ctermbg=NONE guibg=#232323
  ]])
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*'
})
