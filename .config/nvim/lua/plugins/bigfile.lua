return {
  "LunarVim/bigfile.nvim",
  lazy = false,
  cond = true,
  opts = {
    filesize = 1, -- 1MiB
    pattern = {"*"},
    features = { -- features to disable
      "indent_blankline",
      "illuminate",
      "lsp",
      "treesitter",
      "syntax",
      "matchparen",
      "vimopts",
      "filetype",
    },
  }
}
