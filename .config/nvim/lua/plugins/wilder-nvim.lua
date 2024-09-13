return {
  "gelguy/wilder.nvim",
  event = "VeryLazy",
  config = function()
    local wilder = require("wilder")

    -- disable python plugins
    wilder.set_option("use_python_remote_plugin", 0)
    wilder.set_option("pipeline", {
      wilder.branch(
        wilder.cmdline_pipeline ({
          use_python = 0,
          fuzzy = 1,
        }),
        wilder.vim_search_pipeline()
        )
    })
    local popupmenu_palette_renderer = wilder.popupmenu_renderer(
      wilder.popupmenu_palette_theme({
        border = "rounded",
        max_height = "70%",
      })
    )
    wilder.set_option("renderer", popupmenu_palette_renderer)
    wilder.setup({ modes = { ':', '/', '?' } })
  end
}
