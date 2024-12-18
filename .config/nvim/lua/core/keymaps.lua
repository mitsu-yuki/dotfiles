-- ref: https://superuser.com/questions/299646/vim-make-star-command-stay-on-current-word
-- カーソル位置の単語をハイライトするやつ
vim.keymap.set("n", "*", "<cmd>let @/='\\<'.expand('<cword>').'\\>'<CR>:set hlsearch<CR>", { desc = "Highlighting word"})

--ref: https://github.com/neovim/nvim-lspconfig/blob/796394fd19fb878e8dbc4fd1e9c9c186ed07a5f4/README.md#suggested-configuration
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Open float window" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

--ref: https://zenn.dev/vim_jp/articles/43d021f461f3a4
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('x', 'p', 'P')
