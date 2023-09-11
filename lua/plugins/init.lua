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

	{ "MunifTanjim/nui.nvim" },
	{ "nvim-lua/plenary.nvim" },

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			vim.opt.termguicolors = true
			-- vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1c1c29 gui=nocombine]])
			-- vim.cmd([[highlight IndentBlanklineIndent2 guibg=#20202e gui=nocombine]])
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
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({})
			vim.cmd(":TSUpdate")
			vim.cmd(":TSEnable highlight")
		end,
	},

	{
		'nvim-treesitter/nvim-treesitter-context',
		event = { "BufReadPost", "BufNewFile" },
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
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = { "html", "xml" },
			})
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		event = { "BufReadPost", "BufNewFile" },
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
        update_focused_file = {
          enable = true,
        },
        git = {
          ignore = false,
        },
        renderer = {
          root_folder_label = false,
        },
			})
		end,
	},

	{
		'folke/trouble.nvim',
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require('trouble').setup()
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
			-- vim.cmd.colorscheme("tokyonight-day")
		end,
	},

	{ "dstein64/vim-startuptime" },

	{
		"NvChad/nvterm",
		event = { "BufReadPost", "BufNewFile" },
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

  {
    'jedrzejboczar/possession.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('possession').setup {
        commands = {
            save = 'SSave',
            load = 'SLoad',
            delete = 'SDelete',
            list = 'SList',
        }
      }

    end,
  },

  {
    'unblevable/quick-scope',
    config = function()
    end,
  }

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

local dap = require('plugins.dap')
for p = 1, table.getn(dap) do
	table.insert(plugins, dap[p])
end

local dap = require('plugins.dap')
for p = 1, table.getn(dap) do
	table.insert(plugins, dap[p])
end

local mini = require('plugins.mini')
for p = 1, table.getn(mini) do
	table.insert(plugins, mini[p])
end

return plugins

