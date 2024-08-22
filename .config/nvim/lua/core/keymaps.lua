vim.keymap.set("n", "<C-F>", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<C-G>", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<C-T>g", "<cmd>Telescope grep_string default_text=<CR>")
vim.keymap.set("n", "<C-B>", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<C-T>n", "<cmd>Telescope notify<CR>")

-- ref: https://superuser.com/questions/299646/vim-make-star-command-stay-on-current-word
-- カーソル位置の単語をハイライトするやつ
vim.keymap.set("n", "*", "<cmd>let @/='\\<'.expand('<cword>').'\\>'<CR>:set hlsearch<CR>")

--ref: https://github.com/neovim/nvim-lspconfig/blob/796394fd19fb878e8dbc4fd1e9c9c186ed07a5f4/README.md#suggested-configuration
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Open flaot window" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set(
      'n', 'gd', "<cmd>Lspsaga peek_definition<CR>",
      { buffer = ev.buf, desc = "Show Code definition" }
    )
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set(
      'n', 'K', "<cmd>Lspsaga hover_doc<CR>",
      { buffer = ev.buf, desc = "Show documentation" }
    )
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set(
      'n', '<space>D', "<cmd>Lspsaga peek_type_definition<CR>",
      { buffer = ev.buf, desc = "Show type definition" }
    )
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set(
      { 'n', 'v' }, '<space>ca', "<cmd>Lspsaga code_action<CR>",
      { buffer = ev.buf, desc = "Show code action" }
    )
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
