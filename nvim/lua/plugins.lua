vim.cmd('packadd packer.nvim')

load_conf = function(name)
  return require(string.format("config.%s", name))
end

require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}
  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {
    'williamboman/mason.nvim',
    config = function()
      require('config.mason')
    end
  }
  use {'williamboman/mason-lspconfig.nvim'}

  -- 補完
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('config.cmp')
    end
  }
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use {'L3MON4D3/LuaSnip'}
  use {'saadparwaiz1/cmp_luasnip'}

  -- ステータスライン
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('config.lualine')
    end
  }

  -- tabline
  use {
    'akinsho/bufferline.nvim',
    requires = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('config.bufferline')
    end
  }
  -- ファジーファインダー
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'BurntSushi/ripgrep'},
    },
    config = function()
      require('config.telescope')
    end
  }
  use {
    'nvim-telescope/telescope-frecency.nvim',
    requires = {
      {'kkharji/sqlite.lua'}
    },
    config = function()
      require('config.telescope-frecency')
    end
  }

  --  color scheme
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('config.onedark')
    end
  }

  -- transparent background
  use {
    'xiyaowong/nvim-transparent',
    config = function()
      require('config.nvim-transparent')
    end
  }
  -- ファイラ
 use {
   'nvim-tree/nvim-tree.lua',
   requires = {
     {'nvim-tree/nvim-web-devicons'}, -- optional, for file icons
   },
   config = function()
     require('config.nvim-tree')
   end
 }
  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSupdate',
    config = function()
      require('config.nvim-treesitter')
    end
  }
  -- indent blankline
  use {
    'lukas-reineke/indent-blankline.nvim',
    requieres = {
      {'nvim-treesitter/nvim-treesitter'}
    },
    config = function()
      require('config.indent-blankline')
    end
  }
  -- print function name on cursole
  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('config.nvim-treesitter-context')
    end
  }
  -- auto pair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('config.autopairs')
    end
  }
  -- tabout
  use {
    'abecodes/tabout.nvim',
    config = function()
      require('config.tabout')
    end
  }
  -- smart split
  use {
    'mrjones2014/smart-splits.nvim',
    config = function()
      require('config.smart-splits')
    end
  }
  -- startup time
  use {
    'dstein64/vim-startuptime',
  }
-- git mods
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsigns')
    end
  }
-- scroll bar
  use {
    "petertriho/nvim-scrollbar",
    config = function()
      require('config.nvim-scrollbar')
    end,
  }
-- search highlight
  use {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('config/nvim-hlslens')
    end,
  }
end)
