return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  opts = {
    flavour = "mocha",
    transparent_background = true,
    integrations = {
      mason = true,
      noice = true,
      telescope = {
        enabled = true
      },
      illuminate = {
        enabled = true,
        lsp = false,
      },
      lsp_trouble = true,
    }
  },
  config = function(_,opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end
}

