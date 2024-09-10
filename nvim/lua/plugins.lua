  return {
      -- common
      'lewis6991/gitsigns.nvim',
      {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
  },
   {
      'nvim-telescope/telescope.nvim',
      dependencies = { {'nvim-lua/plenary.nvim'} }
  },
{'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- themes
  -- use 'folke/tokyonight.nvim'
  -- use 'rose-pine/neovim'
   "rebelot/kanagawa.nvim",

  -- LSP 
{
	  'VonHeikemen/lsp-zero.nvim',
	  dependencies = {
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
  },

  -- general dev
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
  ensure_installed = { "typescript", "javascript", "rust", "python", "lua" },
          sync_install = true,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 },
  'nvim-treesitter/nvim-treesitter-context',
  {
      'windwp/nvim-ts-autotag',
      config = function() require('nvim-ts-autotag').setup() end
      },
  {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },

  'ggandor/leap.nvim',
  'mbbill/undotree',
  'tpope/vim-fugitive',

  -- Rust
  'rust-lang/rust.vim',

  -- JS
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',

  -- Debugging
  'nvim-lua/plenary.nvim',
  'mfussenegger/nvim-dap',
}
