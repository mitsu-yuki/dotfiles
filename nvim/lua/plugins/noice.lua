return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    cmdline = {
      enable = true,
      view = "cmdline_popup"
    },
    messages = {
      enable = true
    }
  }
}
