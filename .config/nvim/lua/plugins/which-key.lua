return {
  "folke/which-key.nvim",
  event = {"CursorHold", "CursorHoldI"},
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {}
}
