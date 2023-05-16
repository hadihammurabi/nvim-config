local plugins = {
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				window = {
					border = "rounded",
					padding = { 2, 2, 2, 2 },
				},
				triggers = { "<leader>" },
			})
		end,
	},

	{
		"mfussenegger/nvim-dap",
		event = "BufRead",
	},

	{
		"rcarriga/nvim-dap-ui",
		event = "BufRead",
		config = function()
			require("dapui").setup({
				layouts = {
					{
						position = "left",
						size = 40,
						elements = {
							-- {
							--   id = "breakpoints",
							--   size = 0.10,
							-- },
							-- {
							--   id = "stacks",
							--   size = 0.25,
							-- },
							-- {
							--   id = "watches",
							--   size = 0.25,
							-- },
							-- {
							--   id = "scopes",
							--   size = 0.40,
							-- },
						},
					},
					{
						position = "bottom",
						size = 15,
						elements = {
							-- {
							--  id = "console",
							--  size = 0.5,
							-- },
							{
								id = "repl",
								size = 0.5,
							},
						},
					},
				},
			})
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local nl = require("null-ls")
			nl.setup({
				sources = {
					nl.builtins.formatting.goimports,
				},
			})
		end,
	},

	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},

	-- {
	--   "Darazaki/indent-o-matic",
	--   config = function()
	--     require("indent-o-matic").setup({
	--       standard_widths = { 2, 4 }
	--     })
	--   end,
	-- },

	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				options = {
					offsets = {
						{ filetype = "NvimTree" },
					},
				},
			})
		end,
	},
	{ "MunifTanjim/nui.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require('lualine').setup()
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.termguicolors = true
			vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1c1c29 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent2 guibg=#20202e gui=nocombine]])
			require("indent_blankline").setup({
				char = "",
				char_highlight_list = {
					"IndentBlanklineIndent1",
					"IndentBlanklineIndent2",
				},
				space_char_highlight_list = {
					"IndentBlanklineIndent1",
					"IndentBlanklineIndent2",
				},
				show_trailing_blankline_indent = false,
				show_current_context = true,
			})
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.indentscope").setup()
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require("nvim-treesitter.configs").setup({})
			vim.cmd(":TSUpdate")
			vim.cmd(":TSEnable highlight")
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		config = function()
			require('treesitter-context').setup({
				patterns = {
					default = {
						'class',
						'function',
						'method',
						'for', -- These won't appear in the context
						'while',
						'if',
						'switch',
						'case',
						'element',
						'call'
					},
				},
			})
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		event = "BufRead",
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = { "html", "xml" },
			})
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		event = "BufRead",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				view = {
					side = "right",
				},
			})
		end,
	},

	{
		'folke/trouble.nvim',
		config = function()
			require('trouble').setup()
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},

	{ "dstein64/vim-startuptime" },

	{
		"NvChad/nvterm",
		config = function()
			require("nvterm").setup({
				terminals = {
					shell = "/usr/local/bin/fish",
					type_opts = {
						float = {
							width = 0.8,
							height = 0.6,
							row = 0.2,
							col = 0.1,
						},
					},
				},
			})
		end,
	},

	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("illuminate").configure()
		end,
	},

}

local telescope = require('plugins.telescope')
for p = 1, table.getn(telescope) do
	table.insert(plugins, telescope[p])
end

local lsp = require('plugins.lsp')
for p = 1, table.getn(lsp) do
	table.insert(plugins, lsp[p])
end

local cmp = require('plugins.cmp')
for p = 1, table.getn(cmp) do
	table.insert(plugins, cmp[p])
end

local mason = require('plugins.mason')
for p = 1, table.getn(mason) do
	table.insert(plugins, mason[p])
end

return plugins

