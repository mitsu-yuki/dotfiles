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
      end,
      {desc = "Jump to the next hunk"})
      -- prev hunk
      vim.keymap.set("n", "[g", function()
        if vim.wo.diff then
          vim.cmd.normal({"[g", bang = true})
        else
          gitsigns.nav_hunk("prev")
        end
      end,
      {desc = "Preview next hunk"})
      -- aaaa
      vim.keymap.set("n", "<leader>gd", function()
        gitsigns.diffthis(nil, {split = "belowright"})
      end,
      {desc = "gitsigns: Show diff"})
    end
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
    require('scrollbar.handlers.gitsigns').setup()
  end
}
