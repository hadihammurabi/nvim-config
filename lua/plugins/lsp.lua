local servers = {
  lua_ls = {},
  gopls = {},
  ts_ls = {},
  sqlls = {},
  dartls = { install = false }, -- Dart
  ocamllsp = {},
  kotlin_language_server = {},
  rust_analyzer = {
    cmd = {
      "rustup",
      "run",
      "stable",
      "rust-analyzer",
    },
  },
  volar = {
    filetypes = { 'vue' },
    init_options = {
      languagefeatures = {
        completion = {
          defaulttagnamecase = 'both',
          defaultattrnamecase = 'kebabcase',
        },
      },
    },
  },
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ray-x/lsp_signature.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    event = { "bufreadpost", "bufnewfile" },
    opts = {
      servers = servers,
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      local on_attach = function(_, bufnr)
        require "lsp_signature".on_attach({
          bind = true,
        }, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      end

      local mr = require('mason-registry')
      for lsp, config in pairs(opts.servers) do
        if config.install == nil or config.install == true then
          local package = mr.get_package(lsp)
          if not package:is_installed() then
            package:install()
          end
        end

        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        config.on_attach = on_attach
        lspconfig[lsp].setup(config)
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end
  },
  {
    'akinsho/flutter-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
      "nvim-telescope/telescope.nvim",
    },
    ft = { "dart" },
    config = function()
      require("telescope").load_extension("flutter")
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
        closing_tags = {
          enabled = true,
        },
        dev_log = {
          enabled = true,
        },
        lsp = {
          enabled = false,
        }
      }
    end,
  }
}
