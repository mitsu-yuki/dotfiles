return {
  "windwp/nvim-ts-autotag",
  ft = {
    "html",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "svelte",
    "markdown",
  },
  event = {"InsertEnter"},
  dependencies = {"nvim-treesitter/nvim-treesitter"},
  config = function()
    require("nvim-ts-autotag").setup()
  end
}

