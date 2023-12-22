return {
  "petertriho/nvim-scrollbar",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  config = function()
    local search_hl_bg = vim.api.nvim_get_hl(0, {name = "CurSearch"}).bg
    require("scrollbar").setup({
      marks = {
        Search = {color = search_hl_bg},
      },
      excluded_filetypes = {
        "NvimTree",
      }
    })

  end
}
