return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.5',
  name = "telescope",
  cmd = {
    "Telescope"
  },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
        require('telescope').load_extension('frecency')
      end,
      dependencies = { "kkharji/sqlite.lua" }
    },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local extensions = require('telescope').extensions
    telescope.setup({
      defaults = {
        sorting_strategy = 'ascending',
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
    })
    -- keymapings
    vim.keymap.set('n', '<C-T>f', builtin.find_files, {})
    vim.keymap.set('n', '<C-T>g', builtin.live_grep, {})
    vim.keymap.set('n', '<C-T>b', builtin.buffers, {})
    vim.keymap.set('n', '<C-T>F', extensions.frecency.frecency, {})
  end,
}
