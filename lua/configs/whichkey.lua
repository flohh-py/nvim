local wk = require("which-key")

wk.register({
        s = {
            name = "+ Search",
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
            },
            R = { "<cmd>Telescope registers<cr>", "Register" },
        },
        g = {
            name = "Git - Docker",
            g = { "<cmd>lua LazygitToggle()<cr>", "Lazygit" },
        },
        e = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },
        b = {
            name = "+ Buffers",
            l = { "<cmd>Telescope buffers previewer=false<cr>", "List Buffers" },
            -- l = { "<cmd>Telescope buffers<cr>", "List Buffers" },
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
            -- s = { "<cmd>DapContinue<CR>", "Continue" },
            s = { "<cmd>lua DapuiScopes()<CR>", "Scopes" },
            e = { "<cmd>lua DapuiEval()<CR>", "Eval Float" },
            -- r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
        },
        -- WIP
        t = {
            name = "+ Tools",
            t = { "<cmd>lua TermhorizontalToggle()<CR>", "Terminal" },
            f = { "<cmd>lua TermfloatToggle()<CR>", "Terminal Float" },
            D = { "<cmd>lua require('nvim-dap-projects').search_project_config()<CR>", "Load Dap Projects" },
            d = { "<cmd>lua LazydockerToggle()<CR>", "Lazy Docker" },
        },

        n = {
            name = "+ Notifications",
            d = { "<cmd>NoiceDismis<CR>", "Dismiss Notifications" },
            l = { "<cmd>Notifications<CR>", "Dismiss Notifications" },
        },
    },
    { prefix = "<leader>" }
)
