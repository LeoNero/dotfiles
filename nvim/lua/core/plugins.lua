return require('packer').startup(function(use)
    -- packer manages itself
    use 'wbthomason/packer.nvim'

    -- general
    use { "williamboman/mason.nvim" }

    -- improve startup time
    use 'lewis6991/impatient.nvim'

    -- start page
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- tree sitter and tree sitter plugins
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'p00f/nvim-ts-rainbow'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'windwp/nvim-ts-autotag'
    use 'nkrkv/nvim-treesitter-rescript'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'tzachar/fuzzy.nvim'
    use 'nvim-telescope/telescope-ui-select.nvim'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use { "williamboman/mason-lspconfig.nvim" }
    use { 'j-hui/fidget.nvim', branch = 'legacy' }
    use 'RRethy/vim-illuminate'
    use 'onsails/lspkind.nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'folke/lsp-colors.nvim'
    use 'rmagatti/goto-preview'
    use 'mfussenegger/nvim-lint'
    use 'nvim-lua/lsp-status.nvim'
    use 'nvimdev/lspsaga.nvim'
    use 'liuchengxu/vista.vim'
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'weilbith/nvim-code-action-menu'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'simrat39/rust-tools.nvim'
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'
    use 'akinsho/flutter-tools.nvim'
    use 'p00f/clangd_extensions.nvim'
    use {
        'ShinKage/idris2-nvim',
        requires = 'MunifTanjim/nui.nvim',
    }

    -- git
    use 'tpope/vim-fugitive'
    use 'f-person/git-blame.nvim'
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release'
    }
    use { 'akinsho/git-conflict.nvim', tag = "*", config = function()
        require('git-conflict').setup()
    end }

    -- completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'lukas-reineke/cmp-rg'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'andersevenrud/cmp-tmux'
    use 'lukas-reineke/cmp-under-comparator'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'

    -- snippets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- session manager
    -- TODO change here when PR https://github.com/rmagatti/session-lens/pull/42 is merged
    use {
        'guillaumeboehm/session-lens',
        requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
    }

    -- marks and bookmarks
    use 'chentoast/marks.nvim'
    use 'ThePrimeagen/harpoon'

    -- useful mappings
    use 'tpope/vim-surround'

    -- collection of modules
    use 'echasnovski/mini.nvim'

    -- comments
    use 'numToStr/Comment.nvim'
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    -- colorschemes
    use {
        'catppuccin/nvim',
        as = 'catppuccin',
    }
    use 'tiagovla/tokyodark.nvim'
    use 'yazeed1s/minimal.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'savq/melange'
    use 'folke/tokyonight.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'nyoom-engineering/oxocarbon.nvim'
    use 'savq/melange-nvim'

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

    -- terminal
    use 'akinsho/toggleterm.nvim'
    use 'skywind3000/asyncrun.vim'

    -- visual information of where cursor is when jumping around
    use 'DanilaMihailov/beacon.nvim'

    -- colorizer / color highlighter
    use 'norcalli/nvim-colorizer.lua'

    -- indentation info
    use 'lukas-reineke/indent-blankline.nvim'

    -- different wild menu
    use {
        'gelguy/wilder.nvim',
        requires = { 'romgrk/fzy-lua-native' }
    }

    -- which-key
    use 'folke/which-key.nvim'

    -- preview markdown
    use { 'ellisonleao/glow.nvim', branch = 'main' }

    -- editorconfig
    use 'gpanders/editorconfig.nvim'

    -- minimap
    use 'wfxr/minimap.vim'

    -- peek lines
    use 'nacro90/numb.nvim'

    -- range highlighter
    use {
        'winston0410/range-highlight.nvim',
        requires = { 'winston0410/cmd-parser.nvim' }
    }

    -- vim training
    use 'tjdevries/train.nvim'

    -- haskell
    use 'itchyny/vim-haskell-indent'

    -- python
    use 'psf/black'
    use 'hkupty/iron.nvim'

    -- fish
    use 'nickeb96/fish.vim'

    -- coq
    use 'whonore/Coqtail'
    use {
        'tpope/vim-endwise',
        ft = { 'coq' }
    }
    use {
        'andymass/vim-matchup',
        ft = { 'coq' }
    }
    use 'tomtomjhj/coq-lsp.nvim'
    --[[ TODO see https://github.com/ejgallego/coq-lsp ]]

    -- devcontainers
    use 'https://codeberg.org/esensar/nvim-dev-container'

    -- sane parenthesis for Lisp-like languages
    use 'gpanders/nvim-parinfer'

    -- copilot
    use 'github/copilot.vim'

    -- protobuf
    use 'wfxr/protobuf.vim'

    -- latex
    use 'lervag/vimtex'

    -- brainfuck
    use 'llathasa-veleth/vim-brainfuck'

    -- nim
    use 'alaviss/nim.nvim'

    -- llvm
    use 'rhysd/vim-llvm'

    -- crystal
    use 'vim-crystal/vim-crystal'

    -- scala
    use 'scalameta/nvim-metals'

    -- debug adapter protocol and debuggers
    use 'mfussenegger/nvim-dap'
    use {
        'rcarriga/nvim-dap-ui',
        requires = { 'mfussenegger/nvim-dap' }
    }

    -- neodev
    use 'folke/neodev.nvim'

    --[[ NOT NEEDED YET - BUT MAY BE USEFUL IN FUTURE
    -- rearrange windows
    use 'sindrets/winshift.nvim'

    use 'sakhnik/nvim-gdb'

    -- annotation generator
    use 'danymat/neogen'

    -- untrotree
    use 'mbbill/undotree'

    -- quickfix improvement
    use 'stevearc/qf_helper.nvim'

    -- multiple cursors
    use 'mg979/vim-visual-multi'

    -- code runner
    use 'CRAG666/code_runner.nvim'
    use 'jubnzv/mdeval.nvim'

    -- create code snippets
    use 'ellisonleao/carbon-now.nvim'

    -- git
    use 'pwntester/octo.nvim'
    use 'sindrets/diffview.nvim'
    use 'TimUntersberger/neogit'

    -- useful mappings
    use 'ggandor/lightspeed.nvim'
]]
end)
