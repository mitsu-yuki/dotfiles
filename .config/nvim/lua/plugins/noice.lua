return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
    },
    messages = {
      enabled = true,
      view = "mini",
      view_search = false,
      view_options = {
        timeout = 3000
      },
    },
    popupmenu = {
      enabled = false,
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)
    vim.opt.cmdheight = 0
  end
}
