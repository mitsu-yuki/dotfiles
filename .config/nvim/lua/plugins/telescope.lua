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
  keys = {
    { "<C-F>",    "<cmd>Telescope find_files<CR>",                desc = "find files" },
    { "<C-G>",    "<cmd>Telescope live_grep<CR>",                 desc = "live grep" },
    { "<C-T>g",   "<cmd>Telescope grep_string default_text=<CR>", desc = "grep string on cursor word" },
    { "<space>b", "<cmd>Telescope buffers<CR>",                   desc = "buffer list" },
    { "<C-T>n",   "<cmd>Telescope notify<CR>",                    desc = "notify list" },
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
            ["<C-c>"] = { "<esc>", type = "command" },
            ["<CR>"] = { "<esc>", type = "command" },
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
        grep_string = {
          initial_mode = "normal"
        },
        live_grep = {
          only_sort_text = true
        },
      },
    })
  end,
}
