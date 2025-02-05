---@module "lazy"
---@type LazySpec
return {
  "TabbyML/vim-tabby",
  lazy = false,
  enabled = function()
    local ollama_host = os.getenv("ENABLE_TABBY")
    if ollama_host ~= nil then
      return true
    else
      return false
    end
  end,
  tag = "1.4.0",
  init = function()
    vim.g.tabby_keybinding_accept = "<C-f>"
    vim.g.tabby_agent_start_command = {"tabby-agent", "--stdio"}
    vim.g.tabby_inline_completion_trigger = "auto"
  end
}
