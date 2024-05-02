local treeutils = require('configs.nvimtreeutils')
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("nvim-tree").setup({
    sort_by = "case_sensitive",
    actions = {
        open_file = { quit_on_open = false }
    },
    update_focused_file = {
        enable = true,
        update_cwd = false
    },
    filters = {
        git_ignored = false,
        custom = { '^.git$', '^node_modules$' }
    },
    git = {
        enable = true
    },
    log = {
        enable = false,
        types = {
            diagnostics = false
        }
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        debounce_delay = 50,
    },
    on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        vim.keymap.set('n', 'T', treeutils.open_tab_silent, opts('Open Tab Silent'))
        vim.keymap.set('n', '<C-c>', treeutils.change_root_to_global_cwd, opts('Change Root To Global CWD'))
        vim.keymap.set('n', '<c-f>', treeutils.launch_find_files, opts('Launch Find Files'))
        vim.keymap.set('n', '<c-g>', treeutils.launch_live_grep, opts('Launch Live Grep'))
    end
})

-- local HEIGHT_RATIO = 0.8
-- local WIDTH_RATIO = 0.5
-- require('nvim-tree').setup({
--     view = {
--         float = {
--             enable = true,
--             open_win_config = function()
--                 local screen_w = vim.opt.columns:get()
--                 local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
--                 local window_w = screen_w * WIDTH_RATIO
--                 local window_h = screen_h * HEIGHT_RATIO
--                 local window_w_int = math.floor(window_w)
--                 local window_h_int = math.floor(window_h)
--                 local center_x = (screen_w - window_w) / 2
--                 local center_y = ((vim.opt.lines:get() - window_h) / 2)
--                     - vim.opt.cmdheight:get()
--                 return {
--                     border = 'rounded',
--                     relative = 'editor',
--                     row = center_y,
--                     col = center_x,
--                     width = window_w_int,
--                     height = window_h_int,
--                 }
--             end,
--         },
--         width = function()
--             return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
--         end,
--     },
-- })
