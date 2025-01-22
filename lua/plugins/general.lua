return {
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
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
    'kevinhwang91/rnvimr',
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
    "bluz71/vim-moonfly-colors",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("moonfly")
    end,
  },

  {
    'xiyaowong/transparent.nvim',
  },

  { "dstein64/vim-startuptime" },

  {
    "NvChad/nvterm",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvterm").setup({
        terminals = {
          shell = "/usr/bin/fish",
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
