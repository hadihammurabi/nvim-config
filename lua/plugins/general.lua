return {
  {
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" },
  },
  {
    "folke/which-key.nvim",
    cmd = { "WhichKey" },
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        triggers = { "<leader>" },
      })
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
    "mistricky/codesnap.nvim",
    build = "make",
    cmd = { "CodeSnap" },
    config = function()
      require('codesnap').setup {
        watermark = '',
        bg_padding = 0,
        has_breadcrumbs = true,
        mac_window_bar = false,
      }
    end,
  },

  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  }
}
