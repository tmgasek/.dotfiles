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
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use "rafamadriz/friendly-snippets"
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
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

    -- use("github/copilot.vim")


    --  -- Simple plugins can be specified as strings
    --  use '9mm/vim-closer'
    --
    --  -- Lazy loading:
    --  -- Load on specific commands
    --  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    --
    --  -- Load on an autocommand event
    --  use {'andymass/vim-matchup', event = 'VimEnter'}
    --
    --  -- Load on a combination of conditions: specific filetypes or commands
    --  -- Also run code after load (see the "config" key)
    --  use {
    --    'w0rp/ale',
    --    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    --    cmd = 'ALEEnable',
    --    config = 'vim.cmd[[ALEEnable]]'
    --  }
    --
    --  -- Plugins can have dependencies on other plugins
    --  use {
    --    'haorenW1025/completion-nvim',
    --    opt = true,
    --    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
    --  }
    --
    --  -- Plugins can also depend on rocks from luarocks.org:
    --  use {
    --    'my/supercoolplugin',
    --    rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
    --  }
    --
    --  -- You can specify rocks in isolation
    --  use_rocks 'penlight'
    --  use_rocks {'lua-resty-http', 'lpeg'}
    --
    --  -- Local plugins can be included
    --  use '~/projects/personal/hover.nvim'
    --
    --  -- Plugins can have post-install/update hooks
    --  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
    --
    --  -- Post-install/update hook with neovim command
    --  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    --
    --  -- Post-install/update hook with call of vimscript function with argument
    --  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
    --
    --  -- Use specific branch, dependency and run lua file after load
    --  use {
    --    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    --    requires = {'kyazdani42/nvim-web-devicons'}
    --  }
    --
    --  -- Use dependency and run lua function after load
    --  use {
    --    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    --    config = function() require('gitsigns').setup() end
    --  }
    --
    --  -- You can specify multiple plugins in a single call
    --  use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}
    --
    --  -- You can alias plugin names
    --  use {'dracula/vim', as = 'dracula'}
end)
