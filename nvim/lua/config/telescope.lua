require('telescope').setup {
  defaults = {
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ["<C-c>"] = {"<esc>", type = "command"},
      },
      n = {
        ["<C-c>"] = require('telescope.actions').close,
        ["q"] = require('telescope.actions').close,
      },
    },
  },
}

local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions
vim.keymap.set('n', '<C-T>f', builtin.find_files, {})
vim.keymap.set('n', '<C-T>g', builtin.live_grep, {})
vim.keymap.set('n', '<C-T>g', builtin.live_grep, {})
vim.keymap.set('n', '<C-T>F', extensions.frecency.frecency, {})
