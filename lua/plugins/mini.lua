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
      require('mini.pairs').setup()
      require('mini.extra').setup()
      require('mini.files').setup()
      require('mini.indentscope').setup {
        draw = {
          delay = 0,
          animation = require('mini.indentscope').gen_animation.none(),
        },
      }
      local MiniStatusline = require 'mini.statusline'
      MiniStatusline.setup {
        content = {
          active = function()
            local _, mode_hl  = MiniStatusline.section_mode({ trunc_width = 120 })
            local git         = MiniStatusline.section_git({ trunc_width = 40 })
            local diff        = MiniStatusline.section_diff({ trunc_width = 75 })
            local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            -- local lsp            = MiniStatusline.section_lsp({ trunc_width = 75 })
            -- local filename       = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo    = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location    = MiniStatusline.section_location({ trunc_width = 75 })
            -- local search      = MiniStatusline.section_searchcount({ trunc_width = 75 })

            return MiniStatusline.combine_groups({
              { hl = mode_hl,                 strings = { git } },
              { hl = 'MiniStatuslineDevinfo', strings = { diff, diagnostics } },
              '%<',
              -- { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=',
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl,                  strings = { location } },
            })
          end,
        },
      }
    end,
  },
  {
    "echasnovski/mini.pick",
    version = '*',
    dependencies = { "echasnovski/mini.nvim" },
    cmd = { "Pick" },
    config = function()
      require('mini.pick').setup()
      vim.cmd [[
        highlight MiniPickMatchCurrent guibg=#282c34 guifg=#abb2bf gui=bold
        highlight MiniPickCursor guifg=Cyan
      ]]
    end,
  }
}
