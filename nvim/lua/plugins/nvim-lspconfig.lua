return {
  "neovim/nvim-lspconfig",
  event = {"CursorHold", "CursorHoldI"},
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig"
  },
  config = function()
    local mason_lsp = require("mason-lspconfig")
    mason_lsp.setup_handlers({
      function(server)
        local opts = {
          capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
        }
        require("lspconfig")[server].setup(opts)
      end,
    })
    -- ref: https://blog.shinonome.io/unity-neovim/
    vim.cmd("LspStart")
  end
}
