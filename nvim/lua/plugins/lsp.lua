return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim",
      name = "mason",
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
    {"neovim/nvim-lspconfig"},
  },
  config = function()
    local mason = require("mason")
    local mason_lsp = require("mason-lspconfig")
  end
}
