return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      'otavioschwanck/telescope-alternate.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    cmd = { "Telescope" },
    config = function()
      require("telescope").setup({})
    end,
  },
}
