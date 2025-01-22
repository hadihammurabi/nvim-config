function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local wk = require('which-key')
wk.add({
  { "<leader>b",  group = "buffer" },
  { "<leader>bb", ":ls<CR>",                                                                             desc = "List Buffers" },
  { "<leader>bd", ":lua MiniBufremove.delete()<CR>",                                                     desc = "Buffer Close" },
  { "<leader>bn", ":bn<CR>",                                                                             desc = "Buffer Next" },
  { "<leader>bp", ":bp<CR>",                                                                             desc = "Buffer Prev" },
  { "<leader>d",  group = "debugging" },
  { "<leader>dB", ":lua require'dap'.clear_breakpoints()<CR>",                                           desc = "Clear All Breakpoints" },
  { "<leader>db", ":DapToggleBreakpoint<CR>",                                                            desc = "Toggle Breakpoint" },
  { "<leader>dc", ":DapContinue<CR>",                                                                    desc = "Continue" },
  { "<leader>dr", ":lua require'dap'.restart()<CR>",                                                     desc = "Restart Current Session" },
  { "<leader>dt", ":DapTerminate<CR>",                                                                   desc = "Terminate" },
  { "<leader>du", ":lua require('dapui').toggle()<CR>",                                                  desc = "Show UI" },
  { "<leader>f",  group = "find" },
  { "<leader>fd", ":Telescope diagnostics<CR>",                                                          desc = "Diagnostics Search" },
  { "<leader>ff", ":Telescope find_files<CR>",                                                           desc = "Find Files" },
  { "<leader>fg", ":Telescope live_grep<CR>",                                                            desc = "Find Text In Workspace" },
  { "<leader>fo", ":Telescope lsp_document_symbols<CR>",                                                 desc = "Find Symbols (Outline)" },
  { "<leader>fs", ":Telescope possession list<CR>",                                                      desc = "Search Saved Session" },
  { "<leader>fz", ":Telescope current_buffer_fuzzy_find<CR>",                                            desc = "Find Text" },
  { "<leader>g",  group = "git" },
  { "<leader>gD", ":Gitsigns diffthis HEAD<CR>",                                                         desc = "Diff File" },
  { "<leader>gb", ":Gitsigns blame_line<CR>",                                                            desc = "Blame Line" },
  { "<leader>gd", ":Gitsigns preview_hunk<CR>",                                                          desc = "Diff Line" },
  { "<leader>gl", ":terminal lazygit<CR>",                                                               desc = "Lazygit" },
  { "<leader>gr", ":Gitsigns reset_hunk<CR>",                                                            desc = "Blame Line" },
  { "<leader>l",  group = "LSP" },
  { "<leader>lD", ":lua vim.lsp.buf.declaration()<CR>",                                                  desc = "Goto Declaration" },
  { "<leader>la", ":lua vim.lsp.buf.code_action()<CR>",                                                  desc = "Code Action" },
  { "<leader>ld", ":lua vim.lsp.buf.definition()<CR>",                                                   desc = "Goto Definition" },
  { "<leader>lf", ":lua require'conform'.format({ async=false, lsp_fallback=true, timeout_ms=500})<CR>", desc = "Format" },
  { "<leader>lh", ":lua vim.lsp.buf.hover()<CR>",                                                        desc = "Hover" },
  { "<leader>lr", ":lua vim.lsp.buf.rename()<CR>",                                                       desc = "Rename All" },
  { "<leader>lt", ":lua vim.lsp.buf.type_definition()<CR>",                                              desc = "Goto Type Definition" },
  { "<leader>p",  group = "pane" },
  { "<leader>pd", ":TroubleToggle<CR>",                                                                  desc = "Trouble Toggle" },
  { "<leader>t",  group = "tree" },
  { "<leader>tf", ":RnvimrToggle<CR>",                                                                   desc = "File" },
})

wk.add({
  { "<leader>l",  group = "LSP",                                                                         mode = "v" },
  { "<leader>lf", ":lua require'conform'.format({ async=false, lsp_fallback=true, timeout_ms=500})<CR>", desc = "Format", mode = "v" },
})

-- map("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })
-- map("n", "]]", ":lua require'illuminate'.goto_next_reference(false)<CR>", { silent = true })
-- map("n", "[[", ":lua require'illuminate'.goto_prev_reference(false)<CR>", { silent = true })
map("n", "/", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true })

map("n", "<C-s>", ":w<CR>", { silent = true })
map("i", "<C-s>", "<esc>:w<CR>", { silent = true })
map("i", "<Tab>", "<Tab>", { silent = true })

map('i', 'jk', '<ESC>', { silent = true })
map('i', 'kj', '<ESC>', { silent = true })
