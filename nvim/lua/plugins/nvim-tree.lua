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

return {
  "nvim-tree/nvim-tree.lua",
  name = "nvim-tree",
  lazy = false,
  commit = "141c0f97c35f274031294267808ada59bb5fb08e",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = {
    "NvimTreeToggle",
    "NvimTreeOpen",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeRefresh",
  },
  opts = {
    auto_reload_on_write = true,
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
  end,
}
