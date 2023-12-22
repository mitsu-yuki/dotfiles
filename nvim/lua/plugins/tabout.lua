return {
  "abecodes/tabout.nvim",
  event = "BufReadPre",
  opts = {
    tabkey = '<Tab>',
    backwards_tabkey = '<S-Tab>',
    act_as_tab = true,
    act_as_shift_tab = false,
    completion = true,
  }
}
