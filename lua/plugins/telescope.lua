return {
	{ 'otavioschwanck/telescope-alternate.nvim' },
	{ 'nvim-telescope/telescope-ui-select.nvim' },
	{ 'nvim-telescope/telescope-file-browser.nvim' },
	{
		"nvim-telescope/telescope.nvim",
		event = "BufRead",
		config = function()
			require("telescope").setup({})
		end,
	},
}
