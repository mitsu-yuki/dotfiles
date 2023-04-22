vim.cmd('packadd jetpack')
require('jetpack').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {'nvim-lualine/lualine.nvim',
		requires = {
			{'kyazdani42/nvim-web-devicons'},
		}
	}
end)
