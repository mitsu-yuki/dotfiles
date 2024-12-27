---@module "lazy"
---@type LazySpec
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = {"LspAttach"},
  opts = {
    options = {
      multilines = true,
    }
  },
}
