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
      require('mini.extra').setup()
      require('mini.files').setup()
    end,
  },
  {
    "echasnovski/mini.pick", version = '*',
    dependencies = {"echasnovski/mini.nvim"},
    event = 'VeryLazy',
    config = function()
      require('mini.pick').setup()
      vim.cmd [[
        highlight MiniPickMatchCurrent guibg=#282c34 guifg=#abb2bf gui=bold
        highlight MiniPickCursor guifg=Cyan
      ]]
    end,
  }
}
