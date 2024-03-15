return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local conform = require('conform')

      conform.setup({
        formatters_by_ft = {
          go = {'goimports'},
        },
        format_on_save = {
          async = false,
          lsp_fallback = true,
          timeout_ms = 500,
        }
      })
    end
  }
}
