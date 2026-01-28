local servers = {
  lua_ls = { filetypes = { "lua" } },
  gopls = { filetypes = { "go" } },
  sqlls = { filetypes = { "sql" } },
  rust_analyzer = {
    filetypes = { "rust" },
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    for lsp, config in pairs(servers) do
      local filetypes = config.filetypes or {}
      if vim.list_contains(filetypes, vim.bo.filetype) then
        vim.lsp.enable(lsp)
      end
    end
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ray-x/lsp_signature.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      servers = servers,
    },
    config = function(_, opts)
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(opts.servers),
        automatic_enable = false,
      })

      local lspconfig = vim.lsp.config
      local on_attach = function(_, bufnr)
        require "lsp_signature".on_attach({
          bind = true,
        }, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      end

      for lsp, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        config.on_attach = on_attach
        lspconfig(lsp, config)
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
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
