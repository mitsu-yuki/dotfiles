return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        background_colour = "#000000"
      }
    }
  },
  opts = {
    cmdline = {
      enable = true,
      view = "cmdline_popup"
    },
    messages = {
      enable = true,
      view_search = false
    }
  },
}
