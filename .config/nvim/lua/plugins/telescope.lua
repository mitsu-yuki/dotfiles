return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.5',
  cmd = {
    "Telescope"
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        scroll_strategy = "limit",
        mappings = {
          i = {
            ["<C-c>"] = {"<esc>", type = "command"},
            ["<CR>"] = {"<esc>", type = "command"},
          },
          n = {
            ["<C-c>"] = actions.close,
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        buffers = {
          initial_mode = "normal"
        },
        notify = {
          initial_mode = "normal"
        },
        find_files = {
          initial_mode = "normal"
        },
        live_grep = {
          only_sort_text = true
        },
      },
    })
  end,
}
