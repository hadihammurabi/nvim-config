function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local wk = require('which-key')
wk.register({
  f = {
    name = "+find",
    f = { ":Telescope find_files<CR>", "Find Files" },
    o = { ":Telescope lsp_document_symbols<CR>", "Find Symbols (Outline)" },
    z = { ":Telescope current_buffer_fuzzy_find<CR>", "Find Text" },
    g = { ":Telescope live_grep<CR>", "Find Text In Workspace" },
    d = { ":Telescope diagnostics<CR>", "Diagnostics Search" },
    s = { ":Telescope possession list<CR>", "Search Saved Session" },
  },

  --  t = {
  --    name = '+terminal',
  --    h = {
  --      ":lua require('nvterm.terminal').toggle('horizontal')<CR>",
  --      "Terminal Toggle Horizontal",
  --    },
  --    v = {
  --      ":lua require('nvterm.terminal').toggle('vertical')<CR>",
  --      "Terminal Toggle Vertical",
  --    },
  --    f = {
  --      ":lua require('nvterm.terminal').toggle('float')<CR>",
  --      "Terminal Toggle Float",
  --    },
  --    n = { name = '+new' },
  --    nh = {
  --      ":lua require('nvterm.terminal').new('horizontal')<CR>",
  --      "Terminal New Horizontal",
  --    },
  --    nv = {
  --      ":lua require('nvterm.terminal').new('vertical')<CR>",
  --      "Terminal New Vertical",
  --    },
  --  },

  t = {
    name = "+tree",
    f = { ":RnvimrToggle<CR>", "File" }
  },

  d = {
    name = "+debugging",
    u = { ":lua require('dapui').toggle()<CR>", "Show UI" },
    b = { ":DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
    c = { ":DapContinue<CR>", "Continue" },
    t = { ":DapTerminate<CR>", "Terminate" },
    B = { ":lua require'dap'.clear_breakpoints()<CR>", "Clear All Breakpoints" }
  },

  p = {
    name = "+pane",
    d = { ":TroubleToggle<CR>", "Trouble Toggle" },
  },

  b = {
    name = "+buffer",
    b = { ":ls<CR>", "List Buffers" },
    n = { ":bn<CR>", "Buffer Next" },
    p = { ":bp<CR>", "Buffer Prev" },
    d = { ":lua MiniBufremove.delete()<CR>", "Buffer Close" },
  },

  g = {
    name = "+git",
    l = { ":terminal lazygit<CR>", "Lazygit" },
    d = { ":Gitsigns preview_hunk<CR>", "Diff Line" },
    D = { ":Gitsigns diffthis HEAD<CR>", "Diff File" },
    b = { ":Gitsigns blame_line<CR>", "Blame Line" },
  },

  l = {
    name = "+LSP",
    D = { ":lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
    d = { ":lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
    t = { ":lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
    r = { ":lua vim.lsp.buf.rename()<CR>", "Rename All" },
    a = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    f = { ":lua require'conform'.format({ async=false, lsp_fallback=true, timeout_ms=500})<CR>", "Format" },
    h = { ":lua vim.lsp.buf.hover()<CR>", "Hover" },
  },
}, { prefix = '<leader>', mode = 'n' })

wk.register({
  l = {
    name = "+LSP",
    f = { ":lua require'conform'.format({ async=false, lsp_fallback=true, timeout_ms=500})<CR>", "Format" },
  },
}, { prefix = '<leader>', mode = 'v' })

-- map("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })
-- map("n", "]]", ":lua require'illuminate'.goto_next_reference(false)<CR>", { silent = true })
-- map("n", "[[", ":lua require'illuminate'.goto_prev_reference(false)<CR>", { silent = true })
map("n", "/", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true })

map("n", "<C-s>", ":w<CR>", { silent = true })
map("i", "<C-s>", "<esc>:w<CR>", { silent = true })
map("i", "<Tab>", "<Tab>", { silent = true })

map('i', 'jk', '<ESC>', { silent = true })
map('i', 'kj', '<ESC>', { silent = true })
