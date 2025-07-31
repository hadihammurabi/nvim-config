return {
  {
    "saghen/blink.cmp",
    version = '*',
    dependencies = 'rafamadriz/friendly-snippets',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      keymap = {
        preset = "enter",
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
      },
      sources = {
        default = { "lsp", "snippets", "path", "buffer" },
      },
      completion = {
        ghost_text = {
          enabled = true,
        },
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
          }
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          treesitter_highlighting = false,
        },
        list = {
          selection = { preselect = true, auto_insert = false },
        },
      },
    },
  },
}
