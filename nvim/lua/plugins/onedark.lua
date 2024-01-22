return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    opts = {
      style = "darker",
      transparent = true,
      code_style = {
        comments = "none",
      },
      highlights = {
        FloatBorder = {bg = "none"}
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      vim.cmd.colorscheme "onedark"
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    dependencies = {"navarasu/onedark.nvim"},
    opts = {}
  }
}
