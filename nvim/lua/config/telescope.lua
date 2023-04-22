require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-c>"] = {"<esc>", type = "command"},
      },
      n = {
        ["<C-c>"] = require('telescope.actions').close,
      },
    },
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-T>f', builtin.find_files, {})
vim.keymap.set('n', '<C-T>g', builtin.live_grep, {})

