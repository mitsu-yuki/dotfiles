require('telescope').setup {
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-T>f', builtin.find_files, {})
vim.keymap.set('n', '<C-T>g', builtin.live_grep, {})

