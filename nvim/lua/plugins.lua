vim.cmd('packadd packer.nvim')

require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}
  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}

  -- 補完
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/vim-vsnip'}

  -- ステータスライン
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('config.lualine')
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

  -- カラースキーム
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('config.onedark')
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

 -- indent blankline
 use {
   'lukas-reineke/indent-blankline.nvim',
   config = function()
     require('config.indent-blankline')
   end
 }
end)

