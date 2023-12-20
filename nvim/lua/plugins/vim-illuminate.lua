return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = {
    delay = 500
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
    local color_bg2 = require("onedark.colors").bg2
    vim.api.nvim_set_hl(0, "IlluminatedWordText", {bg = color_bg2})
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", {bg = color_bg2})
  end
}
