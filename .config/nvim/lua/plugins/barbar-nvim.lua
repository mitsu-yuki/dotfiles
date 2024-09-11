return {
  "romgrk/barbar.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  opts = {
    highlight_visible = false,
    icons = {
      buffer_number = true,
      gitsigns = {
        added = { enabled = false },
        changed = { enabled = false },
        deleted = { enabled = false },
      },
      filetype = {
        custom_colors = true,
        enabled = true,
      },
    },
  },
  config = function(_, opts)
    require("barbar").setup(opts)
    require("transparent").clear_prefix("Buffer")
    vim.keymap.set("n", "<space>n", "<cmd>BufferNext<CR>", { desc = "Move next buffer" })
    vim.keymap.set("n", "<space>p", "<cmd>BufferPrevious<CR>", { desc = "Move previous buffer" })
    vim.keymap.set("n", "<space>w", "<cmd>BufferClose<CR>", { desc = "Close buffer" })
    vim.keymap.set("n", "<space>W", "<cmd>BufferRestore<CR>", { desc = "Move previous buffer" })
  end

}
