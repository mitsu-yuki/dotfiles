local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = false },
  }),
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  }, {
    {
      name = 'buffer',
      option = {
        keyword_length = 3
      }
    },
    {name = 'path'},
  }),
  experimental = {
    ghost_text = true
  }
})

-- search cmp
cmp.setup.cmdline({'/', '?'},{
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    {name = 'buffer'},
  }
})

-- command mode cmp
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {name = 'path'},
    {name = 'cmdline'},
  })
})

-- diagnostic config (print error code)
local function fmt(diagnostic)
  if diagnostic.code then
    return ("[%s] %s"):format(diagnostic.code, diagnostic.message)
  end
  return diagnostic.message
end

vim.diagnostic.config({
  virtual_text = {
    source = "always",
    format = fmt,
  },
  float = {
    source = "always",
    format = fmt,
  },
  signs = false,
})
