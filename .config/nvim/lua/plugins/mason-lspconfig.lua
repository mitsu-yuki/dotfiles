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
      "gopls",
      "ts_ls",
      "lua_ls",
      "perlnavigator",
    }
  }
}
