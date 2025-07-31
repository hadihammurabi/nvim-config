return {
  {
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" },
  },
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
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    opts = {
      floating_window_scaling_factor = 1,
    },
  },

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
    'folke/trouble.nvim',
    cmd = { "Trouble" },
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

  { 'xiyaowong/transparent.nvim' },
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },

  {
    "mistricky/codesnap.nvim", build="make",
    event = "VeryLazy",
    config = function()
      require('codesnap').setup{
        watermark = '',
        bg_padding = 0,
        has_breadcrumbs = true,
        mac_window_bar = false,
      }
    end,
  },

  -- {
  --   "bluz71/vim-nightfly-colors",
  --   config = function()
  --     vim.cmd.colorscheme("nightfly")
  --   end,
  -- },

  -- {
  --   "NvChad/nvterm",
  --   event = { "BufReadPost", "BufNewFile" },
  --   config = function()
  --     require("nvterm").setup({
  --       terminals = {
  --         shell = "/usr/bin/fish",
  --         type_opts = {
  --           float = {
  --             width = 0.8,
  --             height = 0.6,
  --             row = 0.2,
  --             col = 0.1,
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },

  -- {
  --   'jedrzejboczar/possession.nvim',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   config = function()
  --     require('possession').setup {
  --       commands = {
  --         save = 'SSave',
  --         load = 'SLoad',
  --         delete = 'SDelete',
  --         list = 'SList',
  --       }
  --     }
  --   end,
  -- },


}
