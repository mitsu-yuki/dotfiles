return {
  "akinsho/toggleterm.nvim",
  cmd = {
    "ToggleTerm",
    "TermExec",
    "ToggleTermToggleAll",
    "ToggleTermSendCurrentLine",
    "ToggleTermSendVisualLines",
    "ToggleTermSendVisualSelection",
  },
  keys = { [[<c-\>]] },
  opts = {
    size = 20,
    open_mapping = [[<c-\>]],
    hidde_numbers = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    direction = "float",
    close_on_exit = false,
    float_opts = {
      border = "curved",
    }
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
  end
}
