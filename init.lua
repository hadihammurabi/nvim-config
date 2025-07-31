require("options")

vim.cmd([[autocmd TermOpen * startinsert]])
vim.cmd([[autocmd TextChanged *.* update]])
vim.cmd([[au BufWritePre * :call feedkeys(":nohls\n")]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup('plugins', {
  change_detection = {
    enabled = false,
    notify = false,
  },
})
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
require('keymaps')
