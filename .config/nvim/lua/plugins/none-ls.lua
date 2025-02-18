return {
  "nvimtools/none-ls.nvim",
  evnet ={"CursorHold", "CursorHoldI"},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    -- diagnostic config (print error code)
    local function fmt(diagnostic)
      if diagnostic.code then
        return ("[%s] %s"):format(diagnostic.code, diagnostic.message)
      end
      return diagnostic.message
    end

    vim.diagnostic.config({
      virtual_text = false,
      -- virtual_text = {
      --   source = "always",
      --   format = fmt,
      -- },
      -- float = {
      --   source = "always",
      --   format = fmt,
      --   border = "rounded",
      -- },
      signs = false,
    })
  end
}
