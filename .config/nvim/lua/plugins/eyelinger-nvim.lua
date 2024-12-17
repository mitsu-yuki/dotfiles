---@module "lazy"
---@type LazySpec
return {
  "jinh0/eyeliner.nvim",
  event = {"BufRead", "BufEnter"},
  opts = {
    highlight_on_key = true,
    dim = true,
  },
}
