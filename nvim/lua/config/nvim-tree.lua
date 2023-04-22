vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
require('nvim-tree').setup {
  auto_reload_on_write = true,
  open_on_setup = true,
  open_on_setup_file = true,
  renderer = {
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      show = {
        file = true,
        folder = true,
        folder_arrow = true
      }
    },
  },
  tab = {
    sync = {
      open = true,
      close = true,
    }
  },
}
