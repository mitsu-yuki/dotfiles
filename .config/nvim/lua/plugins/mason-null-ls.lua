return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    automatic_installation = false,
    automatic_setup = true,
    handlers = {},
  },
  config = function(_, opts)
    local null_ls = require("null-ls")
    null_ls.setup({
      border = "rounded",
      debug = false,
      log_level = "warn",
      update_in_insert = false,
      sources = {
        null_ls.builtins.diagnostics.textlint.with({
          command = "npx",                      -- npxで直接textlintを呼び出す
          args = { "textlint", "--format", "json", "--stdin", "--stdin-filename", "$FILENAME" },
          filetypes = { "markdown", "text" },   -- 対象ファイルタイプを指定
        }),
      },
    })
    require("mason-null-ls").setup(opts)
  end
}
