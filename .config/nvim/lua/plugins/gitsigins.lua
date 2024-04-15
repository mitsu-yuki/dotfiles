return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  dependencies = {"petertriho/nvim-scrollbar"},
  opts = {
    on_attach = function()
      local gitsigns = require("gitsigns")
      -- next hunk
      vim.keymap.set("n", "]g", function()
        if vim.wo.diff then
          vim.cmd.normal({"]g", bang = true})
        else
          gitsigns.nav_hunk("next")
        end
      end)
      -- prev hunk
      vim.keymap.set("n", "[g", function()
        if vim.wo.diff then
          vim.cmd.normal({"[g", bang = true})
        else
          gitsigns.nav_hunk("prev")
        end
      end)
    end
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
    require('scrollbar.handlers.gitsigns').setup()
  end
}
