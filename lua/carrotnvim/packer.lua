vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use "rebelot/kanagawa.nvim"
	use ("lewis6991/gitsigns.nvim")
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use('romgrk/barbar.nvim')
	use("nvim-tree/nvim-web-devicons")
	use('neovim/nvim-lspconfig')
	use('jose-elias-alvarez/null-ls.nvim')
	use('MunifTanjim/eslint.nvim')
	use('aktersnurra/no-clown-fiesta.nvim')
	use ("Yggdroot/indentLine")
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('mbbill/undotree')
	use('sidebar-Nvim/sidebar.nvim')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
	use {'akinsho/git-conflict.nvim', tag = "*", config = function()
		require('git-conflict').setup()
	end}
	use('f-person/git-blame.nvim')
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use('prettier/vim-prettier')
	use("shellRaining/hlchunk.nvim")
	use("mfussenegger/nvim-jdtls")
end)
