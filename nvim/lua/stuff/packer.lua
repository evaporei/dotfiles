-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            -- {'williamboman/mason.nvim'},
            -- {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use 'wakatime/vim-wakatime'

    use 'github/copilot.vim'

    use 'simrat39/rust-tools.nvim'

    use 'preservim/nerdtree'

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- pretty cool, will not use yet
    -- use 'junegunn/vim-easy-align'

    use 'tomtom/tcomment_vim'

    -- I like this one, but I'll try to live without it for a bit
    -- use 'cohama/lexima.vim'

    use 'tomasiser/vim-code-dark'
end)
