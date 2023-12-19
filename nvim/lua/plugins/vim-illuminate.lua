return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = {
    delay = 100
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
    local normal_float_hl = vim.api.nvim_get_hl(0, { name = "StatusLine" })
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = normal_float_hl.bg } )
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = normal_float_hl.bg } )
  end
}
