---@module "lazy"
---@type LazySpec
return {
  "github/copilot.vim",
  cmd = {"Copilot"},
  config = function()
    vim.keymap.set("i", "<C-f>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false
    })
    vim.g.copilot_no_tab_map = true
  end
}
