return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local conform = require('conform')

      conform.setup({
        formatters_by_ft = {
          go = { 'goimports' },
          ocaml = { "ocamlformat" },
          c = { "clang-format" },
        },
        formatters = {
          ocamlformat = {
            prepend_args = {
            }
          }
        },
        format_on_save = function(bufnr)
          local ignore_filetypes = { "ocaml" }
          if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
            return
          end
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          if bufname:match("/node_modules/") then
            return
          end
          return {
            async = false,
            lsp_fallback = true,
            timeout_ms = 3000,
          }
        end,
      })
    end
  }
}
