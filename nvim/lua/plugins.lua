vim.cmd('packadd packer.nvim')

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

  use {
    "jay-babu/mason-null-ls.nvim",
    requires = {
      'jose-elias-alvarez/null-ls.nvim',
      'williamboman/mason.nvim',
    },
    config = function()
      require('config.null-ls')
    end,
    wants = { 'mason.nvim' }
  }

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
   commit = "e14989c0eaa6f9c299d48f7e45ce1ed04b21180f",
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
    end,
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
-- scroll bar
  use {
    "petertriho/nvim-scrollbar",
    config = function()
      require('config.nvim-scrollbar')
    end,
    requires = {
      'kevinhwang91/nvim-hlslens',
      'lewis6991/gitsigns.nvim',
    },
    wants = { 'onedark.nvim' }
  }
-- git status
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsigns')
    end,
    wants = { 'nvim-scrollbar' },
  }
-- search highlight
  use {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('config.nvim-hlslens')
    end,
    wants = { 'nvim-scrollbar' },
  }

-- 単語閉じるやつ
  use {
    "kylechui/nvim-surround",
    config = function()
      require('config.nvim-surround')
    end,
  }

-- 横移動強化
  use {
    "unblevable/quick-scope",
    config = function()
      require('config.quick-scope')
    end,
  }
-- git操作
  use {
    'dinhhuy258/git.nvim',
    config = function()
      require('config.git')
    end,
  }
-- 垂直方向にインデント揃えるやつ
  use {
    'Vonr/align.nvim',
    config = function()
      require('config.align')
    end,
  }
-- TODOのハイライト
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require('config.todo-comments')
    end,
  }
-- 自動インデント検出
  use {
    'Darazaki/indent-o-matic',
    config = function ()
      require('config.indent-o-matic')
    end
  }
-- git conflictを解決するやつ
  use {
    "rhysd/conflict-marker.vim",
    config = function()
      require('config.conflict-marker')
    end
  }
end)
