local wk = require("which-key")

wk.register({
        s = {
            name = "Files",
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            t = { "<cmd>Telescope live_grep<cr>", "Search Text" },
            T = {
                function()
                    local folders = vim.lsp.buf.list_workspace_folders()
                    require("telescope.builtin").live_grep {
                        search_dirs = folders,
                    }
                end,
                "Search Text in Workspaces",
            }
        },
        g = {
            name = "Git - Docker",
            g = { "<cmd>lua LazygitToggle()<cr>", "Lazygit" },
            d = { "<cmd>lua LazydockerToggle()<cr>", "LazyDocker" },
        },
        e = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },
        b = {
            name = "Buffers",
            l = { "<cmd>Telescope buffers previewer=false<cr>", "List Buffers" },
            c = { "<cmd>BufDel <cr>", "Close Buffer" },
            a = { "<cmd>BufDelOthers <cr>:<cr>", "Close Others Buffers" },
        },
        h = {
            name = "+ Harpoon",
            a = {
                function()
                    local harpoon = require("harpoon")
                    harpoon:list():append()
                end,
                "Add File"
            },
            l = {
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                "List Marks"
            },
            e = {
                function()
                    local harpoon = require("harpoon")
                    harpoon_toggle_telescope(harpoon:list())
                end,
                "List Marks"
            },
        },

        -- WIP
        d = {
            name = "+ Debug",
            s = { "<cmd>DapContinue<CR>", "Continue" },
        },
        -- WIP
        t = {
            name = "Terminal",
            -- t = { "<cmd>lua ToggleTerm<CR>", "Terminal" },
            f = { "<cmd>lua TermfloatToggle()<CR>", "Terminal Float" },
            D = { "<cmd>lua require('nvim-dap-projects').search_project_config()<CR>", "Load Dap Projects" },
            d = { "<cmd>lua LazydockerToggle()<CR>", "Lazy Docker" },
        },

    },
    { prefix = "<leader>" }
)
