require 'nvim-treesitter.configs'.setup {
    ignore_install = {},
    modules = {},
    ensure_installed = {
        "typescript",
        "javascript",
        "html",
        "python",
        "css",
        "tsx",
        "lua",
        "rust",
        "json",
        "regex",
        "markdown",
        "c",
        "vimdoc",
        "markdown_inline"
    },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = {}
    },
    autotag = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    },
    context_commentstring = {
        enable = true,
    },
}

require 'treesitter-context'.setup {
    enable = true,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = nil,
    zindex = 20,
    on_attach = nil,
}
