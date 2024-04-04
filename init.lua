require('plugins')
require('configs')


vim.opt.guifont = "agave Nerd Font Mono:h16"
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'
vim.o.guifont = "agave Nerd Font Mono:h16"
vim.o.undofile = true
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.hlsearch = false
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.wo.signcolumn = 'yes'

------------------------------------
-- NEOVIDE
------------------------------------

-- vim.g.neovide_profiler = true
vim.g.neovide_refresh_rate = 120
vim.g.neovide_refresh_rate_idle = 5
-- vim.g.neovide_no_idle = true
vim.g.neovide_cursor_animation_length = 0.15
vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_vfx_mode = "railgun"
