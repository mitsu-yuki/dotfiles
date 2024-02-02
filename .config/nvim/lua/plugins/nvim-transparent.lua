return {
  "xiyaowong/nvim-transparent",
  event = "VimEnter",
  dependencies = { "navarasu/onedark.nvim" },
  opts = {
    extra_groups = {
      "NvimTreeNormal",
      "NvimTreeEndOfBuffer",
      "LazyNormal"
    }
  }
}
