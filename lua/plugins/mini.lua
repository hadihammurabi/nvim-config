return {
  {
    "echasnovski/mini.nvim",
    version = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('mini.comment').setup()
      require('mini.bracketed').setup()
      require('mini.icons').setup()
      require('mini.bufremove').setup({
        silent = true,
      })
      require('mini.surround').setup()
      require('mini.move').setup()
      require('mini.tabline').setup()
      require('mini.statusline').setup()
      require('mini.pairs').setup()
    end,
  },
}
