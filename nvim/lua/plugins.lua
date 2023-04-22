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
	use {'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = require('config.lualine')
	}

	-- ファジーファインダー
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
end)


require('mason').setup()
