return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  opts = {
    sections = {
      lualine_a = {
        function()
          local mode = require("lualine.utils.mode").get_mode()
          local rec = vim.fn.reg_recording()
          if rec ~= "" then
            return mode .. " (recording @" .. rec .. ")"
          end
          return mode .. ""
        end
      },
      lualine_b = {
        "branch", "diagnostics"
      },
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
      section_separators = { left = "", right = "" },
    }
  }
}
