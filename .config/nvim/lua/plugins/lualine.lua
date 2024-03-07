return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  opts = {
    sections = {
      lualine_c = {
        {
          'filename',
          file_status = true,
          path = 1,
        }
      }
    },
    options = {
      theme = "catppuccin",
      component_separators = { left = '', right = '' },
      section_separators = {left = "", right = ""},
    }
  }
}
