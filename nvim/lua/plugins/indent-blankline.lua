return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  tag = "v2.20.8",
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('indent_blankline').setup({
      show_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    })
    -- indent-blankline vim option
    vim.opt.list = true
    vim.opt.listchars = { space = ' ', tab = ' ╌' }
  end,
}
