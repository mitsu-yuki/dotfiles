require('indent_blankline').setup {
  show_char_blankline = " ",
}

-- indent-blankline vim option
vim.opt.list = true
vim.opt.listchars = { space = ' ', tab = '  ' }
vim.t.indent_blankline_char = '┆'
