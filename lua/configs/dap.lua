-- require('dap.ext.vscode').load_launchjs()
local dap = require("dap")

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
            return "/Library/Frameworks/Python.framework/Versions/3.8/bin/python3"
            -- return 'python3'
        end,
    },
}


-- local py_venv = os.getenv "CONDA_DEFAULT_ENV" or os.getenv "VIRTUAL_ENV"
-- local python_path = py_venv and py_venv .. '/bin/python' or vim.fn.exepath 'python3'
dap.adapters.python = {
    type = "executable",
    -- command = python_path,
    command = "/Library/Frameworks/Python.framework/Versions/3.8/bin/python3",
    args = { "-m", "debugpy.adapter" },
}
