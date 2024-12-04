return {
  "folke/todo-comments.nvim",
  dependencies = {"nvim-lua/plenary.nvim"},
  event = {"CursorHold", "CursorHoldI"},
  opts = {
    highlight = {
      comments_only = false,
    },
  },
  config = function(_, opts)
    require("todo-comments").setup(opts)
    vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, {desc = "Next todo comment"})
    vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, {desc = "Previous todo comment"})
  end
}
