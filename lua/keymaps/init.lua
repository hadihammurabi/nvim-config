function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('i', 'jk', '<ESC>', { silent = true })
map('i', 'kj', '<ESC>', { silent = true })

local wk = require('which-key')
wk.register({
    ["<leader>f"] = { name = "+find" },
    ["<leader>ff"] = { ":Telescope find_files<CR>", "Find Files" },
    ["<leader>fo"] = { ":Telescope lsp_document_symbols<CR>", "Find Symbols (Outline)" } ,
    ["<leader>fz"] = { ":Telescope current_buffer_fuzzy_find<CR>", "Find Text" },
    ["<leader>fg"] = { ":Telescope live_grep<CR>", "Find Text In Workspace" },
    ["<leader>fd"] = { ":Telescope diagnostics<CR>", "Diagnostics Search" },
    ["<leader>fs"] = { ":Telescope possession list<CR>", "Search Saved Session" },

    ['<leader>t'] = { name = '+terminal' },
    ['<leader>th'] = {
      ":lua require('nvterm.terminal').toggle('horizontal')<CR>",
      "Terminal Toggle Horizontal",
    },
    ['<leader>tv'] = {
      ":lua require('nvterm.terminal').toggle('vertical')<CR>",
      "Terminal Toggle Vertical",
    },
    ['<leader>tf'] = {
      ":lua require('nvterm.terminal').toggle('float')<CR>",
      "Terminal Toggle Float",
    },
    ['<leader>tn'] = { name = '+new' },
    ['<leader>tnh'] = {
      ":lua require('nvterm.terminal').new('horizontal')<CR>",
      "Terminal New Horizontal",
    },
    ['<leader>tnv'] = {
      ":lua require('nvterm.terminal').new('vertical')<CR>",
      "Terminal New Vertical",
    },

    ["<leader>d"] = { name = "+debugging" },
    ["<leader>du"] = { ":lua require('dapui').toggle()<CR>", "" },
    ["<leader>db"] = { ":DapToggleBreakpoint<CR>", "" },
    ["<leader>dc"] = { ":DapContinue<CR>", "" },
    ["<leader>dt"] = { ":DapTerminate<CR>", "" },

    ["<leader>p"] = { name = "+pane" },
    ["<leader>pd"] = { ":TroubleToggle<CR>", "Trouble Toggle" },

    ["<leader>b"] = { name = "+buffer" },
    ["<leader>bb"] = { ":ls<CR>", "List Buffers" },
    ["<leader>bn"] = { ":bn<CR>", "Buffer Next" },
    ["<leader>bp"] = { ":bp<CR>", "Buffer Prev" },
    ["<leader>bd"] = { ":lua MiniBufremove.delete()<CR>", "Buffer Close" },

    ["<leader>g"] = { name = "+git" },
    ["<leader>gl"] = { ":terminal lazygit<CR>", "Lazygit" },
    ["<leader>gd"] = { ":Gitsigns preview_hunk<CR>", "Diff Line" },
    ["<leader>gD"] = { ":Gitsigns diffthis HEAD<CR>", "Diff File" },
    ["<leader>gb"] = { ":Gitsigns blame_line<CR>", "Blame Line" },

    ["<leader>l"] = { name = "+LSP" },
    ["<leader>lD"] = { ":lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
    ["<leader>ld"] = { ":lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
    ["<leader>lt"] = { ":lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
    ["<leader>lr"] = { ":lua vim.lsp.buf.rename()<CR>", "Rename All" },
    ["<leader>la"] = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    ["<leader>lf"] = { ":lua vim.lsp.buf.format({ async = true })<CR>", "Format" },
    ["<leader>lh"] = { ":lua vim.lsp.buf.hover()<CR>", "Hover" },

})

map("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<C-s>", ":w<CR>", { silent = true })
map("n", "]]", ":lua require'illuminate'.goto_next_reference(false)<CR>", { silent = true })
map("n", "[[", ":lua require'illuminate'.goto_prev_reference(false)<CR>", { silent = true })
map("n", "/", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true })

map("i", "<C-s>", "<esc>:w<CR>", { silent = true })
map("i", "<Tab>", "<Tab>", { silent = true })

