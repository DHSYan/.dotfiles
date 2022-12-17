-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	-- ColorSchemes
	use 'folke/tokyonight.nvim'
	use 'marko-cerovac/material.nvim'

	use 'Pocco81/auto-save.nvim'

	use 'ellisonleao/glow.nvim'

	use 'ThePrimeagen/vim-be-good'
  use 'ThePrimeagen/harpoon'


	use 'nvim-lua/plenary.nvim' --need it for telescope
	use 'nvim-telescope/telescope.nvim' --need plenary

	use {
		"AckslD/nvim-neoclip.lua",
		requires = {
			-- you'll need at least one of these
			{'nvim-telescope/telescope.nvim'},
			-- {'ibhagwan/fzf-lua'},
		},
		config = function()
			require('neoclip').setup()
		end,
	}
--	use 'frazrepo/vim-rainbow'


	-- LSP?
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

	-- Completion... Needs LSP?
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

	use 'lervag/vimtex'


	use "terrortylor/nvim-comment"
  use	"nikvdp/neomux"

end)
