return {
  { 'otavioschwanck/telescope-alternate.nvim' },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "jedrzejboczar/possession.nvim",
      "nvim-lua/plenary.nvim",
      "akinsho/flutter-tools.nvim",
    },
    config = function()
      require("telescope").setup({})
      require("telescope").load_extension("flutter")
      require('telescope').load_extension('possession')
    end,
  },
}
