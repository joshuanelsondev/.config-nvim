-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'dense-analysis/ale',
    config = function()
      vim.g.ale_linters = {
        javascript = {'eslint'},
        javascriptreact = {'eslint'},
        typescript = {'eslint'},
        typescriptreact = {'eslint'}
      }
      vim.g.ale_fixers = {
        javascript = {'eslint'},
        javascriptreact = {'eslint'},
        typescript = {'eslint'},
        typescriptreact = {'eslint'}
      }
      vim.g.ale_fix_on_save = 1
    end
  }
  use 'neovim/nvim-lspconfig'
  --use 'mfussenegger/nvim-jdtls'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('ThePrimeagen/harpoon')
  use('tpope/vim-fugitive')
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use('mbbill/undotree')

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }


  use('mattn/emmet-vim')

  -- Themes
  use { "catppuccin/nvim", as = "catppuccin" }

  use ("EdenEast/nightfox.nvim")

  use ('shaunsingh/nord.nvim')

  use('marko-cerovac/material.nvim')

  use('nvim-tree/nvim-web-devicons')

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

end)
