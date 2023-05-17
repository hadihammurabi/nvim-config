require("options")

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format({ async = true }) ]])
vim.cmd([[autocmd CursorMovedI * lua vim.lsp.buf.hover() ]])
vim.cmd([[autocmd InsertEnter * lua vim.lsp.buf.hover() ]])
vim.cmd([[autocmd BufWinLeave * mkview ]])
vim.cmd([[autocmd BufWinEnter * silent loadview ]])

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
require('keymaps')

