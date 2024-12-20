---@module "lazy"
---@type LazySpec
return {
  "romgrk/barbar.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  ---@type barbar.config.options
  ---@diagnostic disable: missing-fields
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
        custom_colors = false,
        enabled = true,
      },
    },
  },
  ---@diagnostic enable: missing-fields
  config = function(_, opts)
    require("barbar").setup(opts)
    require("transparent").clear_prefix("Buffer")
    -- 文字色の背景ハイライト削除
    vim.api.nvim_create_autocmd(
      { 'BufEnter', 'BufWinEnter', 'BufWinLeave', 'BufWritePost', 'TabEnter', 'VimResized', 'WinEnter', 'WinLeave',
        'User' }, {
        callback = vim.schedule_wrap(function()
          require("transparent").clear_prefix("DevIcon")
        end),
        group = "barbar_render",
      })
    vim.keymap.set("n", "<leader>n", "<cmd>BufferNext<CR>", { desc = "Move next buffer" })
    vim.keymap.set("n", "<leader>p", "<cmd>BufferPrevious<CR>", { desc = "Move previous buffer" })
    vim.keymap.set("n", "<leader>w", "<cmd>BufferClose<CR>", { desc = "Close buffer" })
    vim.keymap.set("n", "<leader>W", "<cmd>BufferRestore<CR>", { desc = "Move previous buffer" })
  end
}
