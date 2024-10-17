return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    ui = {
      code_action = "󰌶 ",
    },
    lightbulb = {
      enable = false,
      sign = false,
      debounce = 100,
    },
    code_action = {
      extend_gitsigns = true
    },
  },
  config = function(_, opts)
    require("lspsaga").setup(opts)
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
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
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
  end
}
