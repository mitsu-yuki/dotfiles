return {
  "xiyaowong/nvim-transparent",
  name = "transparent",
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
