local Terminal       = require('toggleterm.terminal').Terminal

local lazygit        = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    },
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

local termfloat      = Terminal:new({
    direction = "float",
    float_opts = {
        border = "double",
    },
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(
            term.bufnr,
            "t",
            "<F1>",
            "<cmd>close<CR>",
            { noremap = true, silent = true }
        )
    end,
})

local termhorizontal = Terminal:new({
    direction = "horizontal",
    float_opts = {
        border = "double",
    },
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(
            term.bufnr,
            "t",
            "<leader>t",
            "<cmd>close<CR>",
            { noremap = true, silent = true }
        )
    end,
})

------------------------------------
-- LAZYDOCKER
------------------------------------

local lazydocker     = Terminal:new({
    cmd = "lazydocker -f .",
    hidden = true,
    direction = "float",
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(
            term.bufnr,
            "t",
            "<esc>",
            "<cmd>close<CR>",
            { noremap = true, silent = true }
        )
    end,
})

function LazydockerToggle()
    lazydocker:toggle()
end

function TermfloatToggle()
    termfloat:toggle()
end

function TermhorizontalToggle()
    termhorizontal:toggle()
end

function LazygitToggle()
    lazygit:toggle()
end

-- function _G.set_terminal_keymaps()
--     local opts = { buffer = 0 }
--     vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--     vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--     vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--     vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--     vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--     vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
--     vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
-- end
