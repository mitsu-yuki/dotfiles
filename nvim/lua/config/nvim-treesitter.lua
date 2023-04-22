require('nvim-treesitter.configs').setup(
  ensure_installed = {
    'c',
    'lua',
    'bash',
  },
  highlight = {
    enable = true,
    disable = {'vim'}
  }
)
