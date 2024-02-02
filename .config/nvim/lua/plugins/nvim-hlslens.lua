return {
  -- ref: https://github.com/petertriho/nvim-scrollbar/blob/35f99d559041c7c0eff3a41f9093581ceea534e8/README.md#setup-packer
  "kevinhwang91/nvim-hlslens",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  dependencies = {"petertriho/nvim-scrollbar"},
  opts = {
    auto_enable = {
      default = false
    }
  },
  config = function(_, opts)
    -- require('hlslens').setup() is not required
    require("scrollbar.handlers.search").setup({
        -- hlslens config overrides
      override_lens = function () end,
    })

    require("hlslens").setup(opts)
  end,
}
