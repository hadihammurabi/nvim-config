return {
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
