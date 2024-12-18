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
    { 'echasnovski/mini.icons' },
    { 'tpope/vim-sleuth' },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { "lua_ls", "pyright", "lemminx", "cssls", "yamlls" },
            }
        end
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                'williamboman/mason.nvim',
                config = true
            },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'j-hui/fidget.nvim',
                tag = 'legacy',
                opts = {}
            },
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
        'lewis6991/gitsigns.nvim',
        opts = {
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
                vim.keymap.set('n', '<leader>gb', require('gitsigns').blame_line,
                    { buffer = bufnr, desc = '[G]it [B]lame Line' })
                vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = '[P]review [H]unk' })
            end,
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('configs.lualine')
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('configs.blankline')
        end
        -- opts = {
        -- char = '┊',
        -- show_trailing_blankline_indent = false,
        -- },
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
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        config = function()
            require('configs.dap')
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = false,
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        init = function()
            require("configs.dapui")
        end,
        -- config = function()
        --     require("configs.dapui")
        -- end
    },
    {
        "ldelossa/nvim-dap-projects",
        lazy = false,
        -- event = '',
        init = function()
            require("nvim-dap-projects")
        end,
        config = function()
            require("nvim-dap-projects").config_paths = { "./test/nvim-dap.lua", ".vscode/nvim-dap.lua" }
            require("nvim-dap-projects").search_project_config()
        end,
    },
    -- {
    --     'TabbyML/vim-tabby',
    --     lazy = false,
    --     config = function()
    --         require('configs.tabby')
    --     end
    -- },
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require('configs.noice')
    --     end,
    --     opts = {
    --         routes = {
    --             {
    --                 filter = { event = "notify", find = "No information available" },
    --                 opts = { skip = true },
    --             },
    --         },
    --     },
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify",
    --     }
    -- },
    {
        "hrsh7th/cmp-cmdline",
        lazy = true,
        event = "InsertEnter",
        config = function()
            require('configs.cmdline')
        end
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require('configs.harpoon')
        end,
    },
    {
        "ahmedkhalf/project.nvim",
        lazy = false,
        config = function()
            require("configs.project")
        end
    },
    {
        'goolord/alpha-nvim',
        lazy = false,
        -- event = "VimEnter",
        config = function()
            require("configs.alpha")
        end
    },
    -- THEMES
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        config = function()
            vim.cmd [[colorscheme nightfox]]
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        -- config = function()
        --     vim.cmd [[colorscheme tokyonight-storm]]
        -- end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("configs.bufferline")
        end,
    },
    {
        'folke/which-key.nvim',
        lazy = false,
        opts = {},
        config = function()
            require('configs.whichkey')
        end
    }
    --- TESTING
    -- {'tpope/vim-dadbod'}
    -- {'Shatur/neovim-session-manager'}
    -- {'nvim-telescope/telescope-ui-select.nvim' }
    -- { "natecraddock/workspaces.nvim" },
    -- {"idanarye/nvim-buffls"},
    -- {"AckslD/muren.nvim"},
    -- { 'jose-elias-alvarez/typescript.nvim' },
    -- {"mg979/vim-visual-multi"}
})
