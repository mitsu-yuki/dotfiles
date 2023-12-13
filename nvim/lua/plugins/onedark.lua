return {
  {
    "navarasu/onedark.nvim",
    event = "VimEnter",
    name = "onedark.vim",
    opt = {
      style = "darker",
      code_style = {
        comments = "none",
      },
    },
    config = function()
      vim.cmd.colorscheme "onedark"
    end,
  }
}

