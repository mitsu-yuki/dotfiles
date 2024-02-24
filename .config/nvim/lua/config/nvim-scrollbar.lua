local colors = require('onedark.colors')

require('scrollbar').setup({
  marks = {
    Search = { color = colors.orange },
  },
  excluded_filetypes = {
    "NvimTree",
  }
})
