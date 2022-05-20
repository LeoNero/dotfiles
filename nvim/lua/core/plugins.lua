return require('packer').startup(function(use)
    -- packer manages itself
    use 'wbthomason/packer.nvim'

    -- improve startup time
    use 'lewis6991/impatient.nvim'
    use 'henriquehbr/nvim-startup.lua'

    -- tree sitter and tree sitter plugins
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'p00f/nvim-ts-rainbow'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'j-hui/fidget.nvim'
    use 'RRethy/vim-illuminate'
    use 'onsails/lspkind.nvim'
    use 'simrat39/symbols-outline.nvim'

    -- colorschemes
    use 'Mofiqul/dracula.nvim'
    use 'tiagovla/tokyodark.nvim'
    use 'folke/tokyonight.nvim'

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'SmiteshP/nvim-gps'

    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        }
    }

    -- autopairs
    use 'windwp/nvim-autopairs'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- indentation info
    use 'lukas-reineke/indent-blankline.nvim'

    -- tagbar
    use 'preservim/tagbar'

    -- visual information of where cursor is when jumping around
    use 'edluffy/specs.nvim'

    -- zen mode
    use 'folke/zen-mode.nvim'

    -- colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- start page
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- useful mappings
    use 'tpope/vim-surround'

    -- minimap
    use 'wfxr/minimap.vim'

    -- tetris
    use 'alec-gibson/nvim-tetris'

    -- preview markdown
    use { 'ellisonleao/glow.nvim', branch = 'main' }

    -- different wild menu
    use 'gelguy/wilder.nvim'

    -- explain regex
    use {
        'bennypowers/nvim-regexplainer',
        requires = { 'MunifTanjim/nui.nvim' }
    }

    -- open alternative files for the current buffer
    use 'rgroli/other.nvim'

    -- create code snippets
    use 'ellisonleao/carbon-now.nvim'

    -- multiple cursors
    use 'mg979/vim-visual-multi'

    -- collection of modules
    use 'echasnovski/mini.nvim'

    -- which-key
    use {
        --'folke/which-key.nvim',
        'xiyaowong/which-key.nvim' -- TODO temp, change when merged
    }

    -- completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
end)
