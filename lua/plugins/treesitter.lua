return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "dart" },
        highlight = {
          enable = true,
        },
      })
      vim.cmd(":TSUpdate")
      vim.cmd(":TSEnable highlight")
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('treesitter-context').setup({
        patterns = {
          default = {
            'class',
            'function',
            'method',
            'for', -- These won't appear in the context
            'while',
            'if',
            'switch',
            'case',
            'element',
            'call'
          },
        },
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = { "html", "xml", "dart" },
      })
    end,
  },
}
