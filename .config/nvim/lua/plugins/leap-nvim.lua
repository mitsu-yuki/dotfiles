---@module "lazy"
---@type LazySpec
return {
  "ggandor/leap.nvim",
  event = {"CursorHold", "CursorHoldI"},
  config = function()
    local leap = require("leap")
    leap.setup({})
    leap.create_default_mappings()
    --ref: https://github.com/ggandor/leap.nvim/blob/c6bfb191f1161fbabace1f36f578a20ac6c7642c/README.md?plain=1#L467
    vim.keymap.set("n", "s", function()
      leap.leap {
        target_windows = require("leap.user").get_focusable_windows()
      }
    end)

    --ref: https://github.com/ggandor/leap.nvim/blob/c6bfb191f1161fbabace1f36f578a20ac6c7642c/README.md?plain=1#L539
    vim.api.nvim_set_hl(0, "LeapBackDrop", {link = "Comment"})
  end
}
