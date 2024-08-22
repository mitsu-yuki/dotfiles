return {
  "monaqa/dial.nvim",
  event = { "CursorMoved" },
  config = function()
    -- ref: https://github.com/monaqa/dial.nvim/blob/ed4d6a5bbd5e479b4c4a3019d148561a2e6c1490/doc/dial.jax#L211
    local augend = require("dial.augend")
    require("dial.config").augends:register_group {
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.integer.alias.binary,
        augend.date.new {
          pattern = "%Y/%m/%d",
          default_kind = "day",
        },
        augend.date.new {
          pattern = "%Y-%m-%d",
          default_kind = "day",
        },
        augend.date.new {
          pattern = "%m/%d",
          default_kind = "day",
          only_valid = true,
        },
        augend.date.new {
          pattern = "%H:%M",
          default_kind = "day",
          only_valid = true,
        },
        augend.constant.alias.ja_weekday_full,
        augend.constant.alias.bool,
        augend.constant.alias.semver,
      },
    }

    -- plugin key mapping
    vim.keymap.set("n", "<C-a>", function()
      require("dial.map").manipulate("increment", "normal")
    end,
    {desc = "Increment with dial.nvim"})
    vim.keymap.set("n", "<C-x>", function()
      require("dial.map").manipulate("decrement", "normal")
    end,
    {desc = "Decrement with dial.nvim"})
  end
}
