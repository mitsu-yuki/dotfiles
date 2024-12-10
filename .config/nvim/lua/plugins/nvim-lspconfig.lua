return {
  "neovim/nvim-lspconfig",
  event = {"CursorHold", "CursorHoldI"},
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig"
  },
  config = function()
    local mason_lsp = require("mason-lspconfig")
    mason_lsp.setup_handlers({
      function(server)
        local opts = {
          capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
        }

        -- volar settting
        if server == "volar" then
          opts.filetypes = {"vue", "typescript", "javascript"}
          opts.init_options = {
            vue = {
              hybridMode = false,
            }
          }
        end

        -- yaml-language-server setting
        -- ref: https://www.reddit.com/r/neovim/comments/10qrriw/comment/j6rkbzp/
        if server == "yamlls" then
          opts.filetypes = {"yaml", "yml"}
          opts.settings = {
            yaml = {
              hover = true,
              completion = true,
              validate = true,
              schemas = {
                kubernetes = "*.yaml"
              }
            }
          }
        end
        require("lspconfig")[server].setup(opts)
      end,
    })
    -- ref: https://blog.shinonome.io/unity-neovim/
    vim.cmd("LspStart")
  end
}
