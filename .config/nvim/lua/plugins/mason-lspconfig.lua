return {
  "williamboman/mason-lspconfig",
  dependencies = {
    "williamboman/mason.nvim"
  },
  opts = {
    ensure_installed = {
      "bashls",
      "clangd",
      "dockerls",
      "eslint",
      "golangci_lint_ls",
      "gopls",
      "lua_ls",
      "perlnavigator",
      "ts_ls",
      "volar",
      "yamlls",
    }
  }
}
