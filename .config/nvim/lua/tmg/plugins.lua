-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Themes
    use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })
    use "rebelot/kanagawa.nvim"
    use "sainnhe/gruvbox-material"
    use "gruvbox-community/gruvbox"
    use { 'embark-theme/vim', as = 'embark' }
    use 'bluz71/vim-moonfly-colors'
    use "EdenEast/nightfox.nvim"
    use 'sainnhe/everforest'
    use 'sainnhe/sonokai'
    use "Shatur/neovim-ayu"
    use 'bluz71/vim-nightfly-colors'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-path")
    use("onsails/lspkind-nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use "rafamadriz/friendly-snippets"
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use('nvim-treesitter/playground')
    use 'nvim-treesitter/nvim-treesitter-context'
    use("jose-elias-alvarez/null-ls.nvim")
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
    use('tpope/vim-fugitive')
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use('ThePrimeagen/harpoon')
    use "lukas-reineke/indent-blankline.nvim"
    use('mbbill/undotree')
    use 'nvim-tree/nvim-web-devicons'
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    use 'ThePrimeagen/vim-be-good'
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use 'norcalli/nvim-colorizer.lua'
    use("windwp/nvim-autopairs")
    use 'windwp/nvim-ts-autotag'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use("folke/zen-mode.nvim")
    use("j-hui/fidget.nvim")

    use("github/copilot.vim")


end)
