return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    cmdline = {
      enable = true,
      view = "cmdline_popup"
    },
    routes = {
      {
        view = "mini",
        filter = {event = "msg_showmode"}
      }
    }
  },
}
