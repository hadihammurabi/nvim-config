return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ray-x/lsp_signature.nvim",
      "williamboman/mason.nvim",
      {
        "udalov/kotlin-vim",
        ft = "kotlin",
      },
    },
    event = { "bufreadpost", "bufnewfile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local on_attach = function(client, bufnr)
        require "lsp_signature".on_attach({
          bind = true,
        }, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      end

      local lsp = require("lspconfig")
      lsp.gopls.setup({
        on_attach = on_attach,
      })
      lsp.rust_analyzer.setup({
        on_attach = on_attach,
        cmd = {
          "rustup",
          "run",
          "stable",
          "rust-analyzer",
        },
      })
      lsp.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lsp.sqlls.setup({
        on_attach = on_attach,
      })

      lsp.lua_ls.setup({
        on_attach = on_attach,
      })


      lsp.volar.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { 'vue' },
        init_options = {
          languagefeatures = {
            completion = {
              defaulttagnamecase = 'both',
              defaultattrnamecase = 'kebabcase',
            },
          },
        },
      })

      lsp.dartls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lsp.kotlin_language_server.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lsp.ocamlls.setup {
        on_attach = on_attach,
      }

      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
}
