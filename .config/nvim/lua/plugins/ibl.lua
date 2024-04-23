return {
  "lukas-reineke/indent-blankline.nvim",
  event = {"CursorHold", "CursorHoldI"},
  dependencies = {'nvim-treesitter/nvim-treesitter'},
  config = function()
    require("ibl").setup({
      indent = {
        char = "▏",
      },
      scope = {
        enabled = true,
        char = "▏",
        include = {
          node_type = {
            ["*"] = {
              {"*"}
            }
          }
        }
      }
    })
    -- indent-blankline vim option
    vim.opt.list = true
    vim.opt.listchars = {space = ' ', tab = ' ╌'}
  end,
}
