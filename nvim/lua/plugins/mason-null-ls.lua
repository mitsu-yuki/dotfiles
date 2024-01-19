return {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    opts = {
        automatic_installation = true,
        handlers = {},
    },
    config = function(_, opts)
      local null_ls = require("null-ls")
      require("null-ls").setup(opts)
      null_ls.setup({
        sources = {
        }
      })
    end,
}
