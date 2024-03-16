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

  { "MunifTanjim/nui.nvim" },
  { "nvim-lua/plenary.nvim" },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = 'ibl',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.opt.termguicolors = true
      require("ibl").setup()
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
    "bluz71/vim-nightfly-colors",
    config = function()
      vim.cmd.colorscheme("nightfly")
    end,
  },

  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("onedark_dark")
  --   end,
  -- },

  { "dstein64/vim-startuptime" },

  -- {
  -- 	"NvChad/nvterm",
  -- 	event = { "BufReadPost", "BufNewFile" },
  -- 	config = function()
  -- 		require("nvterm").setup({
  -- 			terminals = {
  -- 				shell = "/usr/local/bin/fish",
  -- 				type_opts = {
  -- 					float = {
  -- 						width = 0.8,
  -- 						height = 0.6,
  -- 						row = 0.2,
  -- 						col = 0.1,
  -- 					},
  -- 				},
  -- 			},
  -- 		})
  -- 	end,
  -- },

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

}

local treesitter = require('plugins.treesitter')
for p = 1, table.getn(treesitter) do
  table.insert(plugins, treesitter[p])
end

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

local formatter = require('plugins.formatter')
for p = 1, table.getn(formatter) do
  table.insert(plugins, formatter[p])
end

return plugins
