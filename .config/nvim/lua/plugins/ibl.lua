return {
  "lukas-reineke/indent-blankline.nvim",
  event = {"CursorHold", "CursorHoldI"},
  dependencies = {'nvim-treesitter/nvim-treesitter'},
  config = function()
    require("ibl").setup({
      indent = {
        char = "▏",
      },
    })
    -- indent-blankline vim option
    vim.opt.list = true
    vim.opt.listchars = {space = ' ', tab = ' ╌'}
  end,
}
