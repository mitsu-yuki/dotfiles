return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},
  },
  config = function()
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
        ["<CR>"] = cmp.mapping.confirm({select = false, behavior = cmp.ConfirmBehavior.Replace}),
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

  end
}
