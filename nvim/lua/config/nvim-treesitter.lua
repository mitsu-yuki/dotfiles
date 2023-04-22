require('nvim-treesitter').setup({
  ensure_installed = {
    'c',
    'lua',
    'bash',
  },
  highlight = {
    enable = true,
    disable = {'vim'},
  }
})
