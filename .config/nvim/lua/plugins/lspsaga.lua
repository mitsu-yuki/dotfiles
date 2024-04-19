return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    ui = {
      code_action = "󰌶",
    },
    lightbulb = {
      enable = false,
      sign = false,
      debounce = 100,
    },
    code_action = {
      extend_gitsigns = true
    },
  },
}
