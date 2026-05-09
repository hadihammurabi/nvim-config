local servers = {
  lua_ls = { filetypes = { "lua" } },
  gopls = { filetypes = { "go" } },
  sqlls = { filetypes = { "sql" } },
  clangd = {
    filetypes = { "cpp" },
    cmd = { "clangd" },
  },
  ocamllsp = {
    cmd = { "ocamllsp" },
    filetypes = { "ocaml", "menhir", "ocamlinterface", "ocamllex", "reason", "dune" },
    root_markers = { "*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace" },
  },
  rust_analyzer = {
    filetypes = { "rust" },
    cmd = {
      "rustup",
      "run",
      "stable",
      "rust-analyzer",
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
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "ray-x/lsp_signature.nvim",
      "williamboman/mason.nvim",
      "saghen/blink.cmp",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      servers = servers,
    },
    config = function(_, opts)
      local installed_servers = {}
      for lsp, config in pairs(opts.servers) do
        if config.install ~= false then
          table.insert(installed_servers, lsp)
        end
      end

      require("mason-lspconfig").setup({
        ensure_installed = installed_servers,
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
