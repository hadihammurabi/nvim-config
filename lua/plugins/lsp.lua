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

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(opts.servers),
      })

      for lsp, config in pairs(opts.servers) do
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
}
