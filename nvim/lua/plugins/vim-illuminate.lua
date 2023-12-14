return {
  "RRethy/vim-illuminate",
  name = "illuminate",
  event = "VeryLazy",
  opts = {
    delay = 100
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
    local normal_float_hl = vim.api.nvim_get_hl(0, { name = "StatusLine" })
    vim.api.nvim_set_hl(0, "IlluminatedWordText", normal_float_hl )
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", normal_float_hl )
  end
}
