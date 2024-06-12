require('gitsigns').setup {
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
    delay = 100,
  },
}
