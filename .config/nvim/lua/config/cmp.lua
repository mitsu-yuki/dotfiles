local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  }),
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  }, {
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
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
