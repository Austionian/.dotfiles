return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- common
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- themes
  -- use 'marko-cerovac/material.nvim'
  use 'folke/tokyonight.nvim'
  use 'rose-pine/neovim'
  -- use { "ellisonleao/gruvbox.nvim" }
  -- use {'austionian/oxocarbon.nvim', run = './install.sh'}
  -- use "EdenEast/nightfox.nvim"
  -- use "Shatur/neovim-ayu"
  use 'ayu-theme/ayu-vim'
  -- use "sainnhe/everforest"
  -- use { "catppuccin/nvim", as = "catppuccin" }
  -- use "EdenEast/nightfox.nvim"
  use "rebelot/kanagawa.nvim"
  use({ 'kepano/flexoki-neovim', as = 'flexoki' })
  use {'nyoom-engineering/oxocarbon.nvim'}
  use "wincent/base16-nvim"

  -- LSP 
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- general dev
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-context'
  use {
      'windwp/nvim-ts-autotag',
      config = function() require('nvim-ts-autotag').setup() end
      }
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use 'ggandor/leap.nvim'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'

  -- Rust
  use 'rust-lang/rust.vim'

  -- JS
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  -- Debugging
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'
end)

