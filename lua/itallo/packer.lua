-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
	use 'RRethy/vim-illuminate'
	use {'akinsho/git-conflict.nvim', tag = "*", config = function()
			require('git-conflict').setup()
		end
	}

	use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
	}
	
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
			require("toggleterm").setup()
		end
	}
	--devIcons
	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

	use 'f-person/git-blame.nvim'
	use 'wakatime/vim-wakatime'
	
	use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
	}

  --Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  --Theme
  use 'navarasu/onedark.nvim'

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    -- {'williamboman/mason.nvim'},
    -- {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
      {'neovim/nvim-lspconfig'},
    -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lua'},
      {'rafamadriz/friendly-snippets'}
    }
  }

	use({
  "arsham/arshamiser.nvim",
  requires = {
    "arsham/arshlib.nvim",
    "famiu/feline.nvim",
    "rebelot/heirline.nvim",
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    -- ignore any parts you don't want to use
    vim.cmd.colorscheme("arshamiser_light")
    require("arshamiser.feliniser")
    -- or:
    -- require("arshamiser.heirliniser")

    _G.custom_foldtext = require("arshamiser.folding").foldtext
    vim.opt.foldtext = "v:lua.custom_foldtext()"
    -- if you want to draw a tabline:
    vim.api.nvim_set_option("tabline", [[%{%v:lua.require("arshamiser.tabline").draw()%}]])
  end,
})

end)
