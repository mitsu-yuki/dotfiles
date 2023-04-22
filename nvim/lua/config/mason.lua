local mason = require('mason')
local mason_lsp = require('mason-lspconfig')
local nvim_lsp = require('lspconfig')

mason.setup {
  ui = {
    border = "rounded"
  }
}

mason_lsp.setup_handlers({ function(server)
  local opt = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end })
