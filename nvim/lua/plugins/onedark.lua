return {
  {
    "navarasu/onedark.nvim",
    event = "VimEnter",
    name = "onedark",
    opts = {
      style = "darker",
      code_style = {
        comments = "none",
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      vim.cmd.colorscheme "onedark"
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none"} )
    end,
  }
}
