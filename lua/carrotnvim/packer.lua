vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use "rebelot/kanagawa.nvim"
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use('romgrk/barbar.nvim')
	use('MunifTanjim/eslint.nvim')
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('mbbill/undotree')
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	use {
		"hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
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
	use 'm4xshen/autoclose.nvim'
	use('prettier/vim-prettier')
	use("shellRaining/hlchunk.nvim")
	use("mfussenegger/nvim-jdtls")
	use "mfussenegger/nvim-dap"
	use "folke/trouble.nvim"
	use "j-hui/fidget.nvim"
	use "tpope/vim-fugitive"
	use "lewis6991/gitsigns.nvim"
end)
