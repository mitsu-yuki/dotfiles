return {
  "xiyaowong/nvim-transparent",
  name = "transparent",
  event = "VimEnter",
  dependencies = { "navarasu/onedark" },
  opts = {
    extra_groups = {
      "NvimTreeNormal",
      "NvimTreeEndOfBuffer",
      "LazyNormal"
    }
  }
}
