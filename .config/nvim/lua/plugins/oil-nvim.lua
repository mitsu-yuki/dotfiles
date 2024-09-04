return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "Oil" },
  opts = {
    keymaps = {
      ["q"] = "actions.close",
    },
    view_options = {
      show_hidden = true,
    },
    float = {
      border = "rounded",
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)
    vim.api.nvim_create_user_command("Oil", function()
      require("oil").open_float()
    end, {desc = "Open oil file border on a directory for float window"})
  end
}
