return {
  {
    "saghen/blink.cmp",
    version = '*',
    dependencies = 'rafamadriz/friendly-snippets',
    opts = {
      keymap = {
        preset = "enter",
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
      },
      sources = {
        default = { "lsp", "snippets", "path", "buffer" },
      },
    },
  },
}
