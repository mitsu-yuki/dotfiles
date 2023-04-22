require('bufferline').setup{
  options = {
    mode = "buffers",
    numbers = function(opts)
     return string.format('%s', opts.raise(opts.id))
    end,
    offsets = {
      {
        filetype = "NvimTree",
        highlight = "Directory",
      }
    },
    color_icon = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
  }
}
