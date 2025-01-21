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

  {
    'akinsho/flutter-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        require "lsp_signature".on_attach({ bind = true }, bufnr)
      end

      require("flutter-tools").setup {
        ui = {
          border = "rounded",
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
        },
        widget_guides = {
          enabled = true,
        },
        dev_log = {
          enabled = true,
        },
        lsp = {
          on_attach = on_attach,
          capabilities = capabilities,
        },
      }
    end,
  },
}
