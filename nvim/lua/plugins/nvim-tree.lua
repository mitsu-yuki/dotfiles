-- ref: https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup/5a050ab939ff810868ca7a99b9867518b1b5b518#recipes
local function open_nvim_tree(data)
  local real_file = vim.fn.filereadable(data.file) == 1
  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
  if not real_file and not no_name then
    return
  end
  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

-- ref: https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close/f9ee39e5c1849d21e7a2ec8138dcdd453e721508#marvinth01
local function close_nvim_tree()
  local tree_wins = {}
  local floating_wins = {}
  local wins = vim.api.nvim_list_wins()
  for _, w in ipairs(wins) do
    local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
    if bufname:match("NvimTree_") ~= nil then
      table.insert(tree_wins, w)
    end
    if vim.api.nvim_win_get_config(w).relative ~= '' then
      table.insert(floating_wins, w)
    end
  end
  if 1 == #wins - #floating_wins - #tree_wins then
    -- Should quit, so we close all invalid windows.
    for _, w in ipairs(tree_wins) do
      vim.api.nvim_win_close(w, true)
    end
  end
end

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  commit = "141c0f97c35f274031294267808ada59bb5fb08e",
  cmd = {
    "NvimTreeToggle",
    "NvimTreeOpen",
    "NvimTreeFindFile",
    "NvimTreeFindFileToggle",
    "NvimTreeRefresh",
  },
  opts = {
    auto_reload_on_write = true,
    hijack_netrw = true,
    renderer = {
      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " ",
        },
      },
      icons = {
        webdev_colors = true,
        show = {
          file = true,
          folder = true,
          folder_arrow = true
        }
      },
    },
    tab = {
      sync = {
        open = true,
        close = true,
      }
    },
    update_focused_file = {
      enable = false,
    },
  },
  config = function(data)
    require("nvim-tree").setup(opts)
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    vim.api.nvim_create_autocmd({ "QuitPre" }, { callback = close_nvim_tree })
  end,
}
