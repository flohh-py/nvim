local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    { 'tpope/vim-sleuth' },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim',          config = true },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'j-hui/fidget.nvim',                tag = 'legacy', opts = {} },
            { 'folke/neodev.nvim' },
        },
        config = function()
            require('configs.lsp')
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        lazy = true,
        event = "InsertEnter",
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'rafamadriz/friendly-snippets' },
        },
        opts = {},
        config = function()
            require('configs.cmp')
        end
    },
    {
        'folke/which-key.nvim',
        lazy = false,
        opts = {},
        config = function()
            require('configs.whichkey')
        end
    },
    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
                    { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
                vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
                    { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
                vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = '[P]review [H]unk' })
            end,
        },
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd [[colorscheme tokyonight-storm]]
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = false,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
        },
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        opts = {},
        config = function()
            require('configs.comment')
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('configs.telescope')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-context'
        },
        build = ':TSUpdate',
        config = function()
            require('configs.treesiter')
        end
    },
    {
        'akinsho/toggleterm.nvim',
        lazy = false,
        config = function()
            require('configs.terminal')
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require('configs.nvimtree')
        end
    },
    {
        "ojroques/nvim-bufdel",
        lazy = false,
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {}
    },
    {
        'RRethy/vim-illuminate',
        opts = {},
        event = 'InsertEnter',
        config = function()
            require('illuminate').configure()
        end,
    },
    { "natecraddock/workspaces.nvim" },

    --- TESTING
    -- {"idanarye/nvim-buffls"},
    -- {"AckslD/muren.nvim"},
    -- {
    --     'goolord/alpha-nvim',
    --     event = "VimEnter",
    --     dependencies = { 'nvim-tree/nvim-web-devicons' },
    --     opts = { require 'alpha.themes.dashboard'.config }
    -- },
    -- {
    --     "ahmedkhalf/project.nvim",
    --     config = function()
    --         require("project_nvim").setup {
    --             -- your configuration comes here
    --             -- or leave it empty to use the default settings
    --             -- refer to the configuration section below
    --         }
    --     end
    -- },

    -- { 'jose-elias-alvarez/typescript.nvim' },
    -- { 'onsails/lspkind-nvim' },
})
