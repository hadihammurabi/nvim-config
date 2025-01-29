vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.list = false
vim.opt.mouse = 'v'
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.syntax = 'enable'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
-- vim.opt.listchars:append "eol:¬"
vim.g.transparent_enabled = true

vim.g.mapleader = ' '

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
-- vim.g.netrw_liststyle = 3
vim.g.netrw_sort_sequence = [[[\/]$,*]]
vim.g.netrw_sizestyle = "H"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.g.rnvimr_enable_ex = 1
-- vim.g.rnvimr_enable_picker = 1
-- vim.g.rnvimr_ranger_cmd = { 'ranger', '--cmd=set draw_borders both' }
vim.g.zig_fmt_autosave = 0

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    local path = vim.fn.expand("<afile>")
    if vim.fn.isdirectory(path) == 1 then
      require('yazi').yazi()
    end
  end,
})
