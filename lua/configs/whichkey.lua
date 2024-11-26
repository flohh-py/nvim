local wk = require("which-key")

wk.add(
    {
        -- GROUP
        { "<leader>b", group = " Buffers" },
        {
            "<leader>bP",
            "<cmd>BufferLinePick <cr>",
            desc = "Pick Buffers"
        },
        {
            "<leader>ba",
            "<cmd>BufDelOthers <cr>:<cr>",
            desc = "Close Others Buffers"
        },
        {
            "<leader>bc",
            "<cmd>BufDel <cr>",
            desc = "Close Buffer"
        },
        {
            "<leader>bl",
            "<cmd>Telescope buffers previewer=false<cr>",
            desc = "List Buffers"
        },
        {
            "<leader>bn",
            "<cmd>BufferLineCycleNext <cr>",
            desc = "Next Buffer"
        },
        {
            "<leader>bp",
            "<cmd>BufferLineCyclePrev <cr>",
            desc = "Previus Buffer"
        },
        -- GROUP
        { "<leader>d", group = " Debug" },
        {
            "<leader>de",
            "<cmd>lua DapuiEval()<CR>",
            desc = "Eval Float"
        },
        {
            "<leader>ds",
            "<cmd>lua DapuiScopes()<CR>",
            desc = "Scopes"
        },
        {
            "<leader>e",
            "<cmd>NvimTreeToggle<cr>",
            desc = "NvimTree"
        },
        -- GROUP
        { "<leader>g", group = "Git - Docker" },
        {
            "<leader>gg",
            "<cmd>lua LazygitToggle()<cr>",
            desc = "Lazygit"
        },
        -- GROUP
        { "<leader>h", group = " Harpoon" },
        {
            "<leader>ha",
            function()
                local harpoon = require("harpoon")
                harpoon:list():append()
            end,
            desc = "Add Harpoon Marks"
        },
        {
            "<leader>hl",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "List Harpoon Marks"
        },
        {
            "<leader>he",
            function()
                -- local harpoon = require("harpoon")
                harpoon_toggle_telescope(harpoon:list())
            end,
            desc = "Telescope Harpoon Marks"
        },
        -- GROUP
        { "<leader>n", group = " Notifications" },
        {
            "<leader>nd",
            "<cmd>NoiceDismis<CR>",
            desc = "Dismiss Notifications"
        },
        {
            "<leader>nl",
            "<cmd>Notifications<CR>",
            desc = "Dismiss Notifications"
        },
        -- GROUP
        { "<leader>s", group = " Search" },
        {
            "<leader>sR",
            "<cmd>Telescope registers<cr>",
            desc = "Register"
        },
        {
            "<leader>sf",
            "<cmd>Telescope find_files<cr>",
            desc = "Find File"
        },
        {
            "<leader>st",
            "<cmd>Telescope live_grep<cr>",
            desc = "Search Text"
        },
        {
            "<leader>sT",
            function()
                local folders = vim.lsp.buf.list_workspace_folders()
                require("telescope.builtin").live_grep {
                    search_dirs = folders,
                }
            end,
            desc = "Search Text in Workspaces"
        },
        -- GROUP
        { "<leader>t", group = " Tools" },
        {
            "<leader>tD",
            "<cmd>lua require('nvim-dap-projects').search_project_config()<CR>",
            desc = "Load Dap Projects"
        },
        {
            "<leader>td",
            "<cmd>lua LazydockerToggle()<CR>",
            desc = "Lazy Docker"
        },
        {
            "<leader>tf",
            "<cmd>lua TermfloatToggle()<CR>",
            desc = "Terminal Float"
        },
        {
            "<leader>tt",
            "<cmd>lua TermhorizontalToggle()<CR>",
            desc = "Terminal"
        },
    }
)
