return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig"
    },
    opts = {},
    config = function()
      local mason_lsp = require("mason-lspconfig")
      mason_lsp.setup_handlers {
        function(server)
          local opts = {
            capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
          },
          require("lspconfig")[server].setup(opts)
        end
      }
    end
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = {
      "Mason",
      "MasonUpdate",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog"
    },
    opts = {
      ui = {
        border = "rounded"
      }
    }
  },
  {
    "williamboman/mason-lspconfig",
    dependencies = {
      "williamboman/mason.nvim"
    },
    opts = {}
  }
}
