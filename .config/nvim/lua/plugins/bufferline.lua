return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "catppuccin",
  },
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  opts = {
    options = {
      mode = "buffers",
      numbers = 'buffer_id',
      offsets = {
        {
          filetype = "NvimTree",
          highlight = "Directory",
        }
      },
      color_icon = true,
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get()
  }
}
