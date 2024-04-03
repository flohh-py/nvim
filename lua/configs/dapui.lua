local dap, dapui = require("dap"), require("dapui")

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

local autocmd = vim.api.nvim_create_autocmd
autocmd("Filetype", {
    pattern = { "dap-float" },
    command = "nnoremap <buffer><silent> q <cmd>close!<CR>",
})
autocmd("Filetype", {
    pattern = { "dap-hover" },
    command = "nnoremap <buffer><silent> q <cmd>close!<CR>",
})

function DapuiScopes()
    dapui.float_element(
        'scopes',
        { width = 200, height = 20, enter = true }
    )
end

function DapuiEval()
    local winopts = {
        width = 10,
        height = 10,
        border = "rounded",
    }
    local widgets = require("dap.ui.widgets")
    -- widgets.hover(vim.lsp.buf.hover(), winopts)
    widgets.hover()
end
