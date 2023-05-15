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
    ["<leader>fb"] = { ":Telescope buffers<CR>", "Find Opened Buffers" },
    ["<leader>fl"] = { ":Telescope lsp_document_symbols<CR>", "Find Symbols" } ,
    ["<leader>fz"] = { ":Telescope current_buffer_fuzzy_find<CR>", "Find Text" },
    ["<leader>fg"] = { ":Telescope live_grep<CR>", "Find Text In Workspace" },
    ["<leader>fd"] = { ":Telescope diagnostics<CR>", "Diagnostics Search" },

    ['<leader>t'] = { name = '+terminal' },
    ['<leader>th'] = { ":lua require('nvterm.terminal').toggle('horizontal')<CR>", "Terminal Toggle Horizontal" },
    ['<leader>tv'] = { ":lua require('nvterm.terminal').toggle('vertical')<CR>", "Terminal Toggle Vertical" },
    ['<leader>tf'] = { ":lua require('nvterm.terminal').toggle('float')<CR>", "Terminal Toggle Float" },
    ['<leader>tn'] = { name = '+new' },
    ['<leader>tnh'] = { ":lua require('nvterm.terminal').new('horizontal')<CR>", "Terminal New Horizontal" },
    ['<leader>tnv'] = { ":lua require('nvterm.terminal').new('vertical')<CR>", "Terminal New Vertical" },

    ["<leader>d"] = { name = "+debugging" },
    ["<leader>du"] = { ":lua require('dapui').toggle()<CR>", "" },
    ["<leader>db"] = { ":DapToggleBreakpoint<CR>", "" },
    ["<leader>dc"] = { ":DapContinue<CR>", "" },
    ["<leader>dt"] = { ":DapTerminate<CR>", "" },

    ["<leader>p"] = { name = "+pane" },
    ["<leader>pd"] = { ":TroubleToggle<CR>", "Trouble Toggle" },
})

map("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<C-s>", ":w<CR>", { silent = true })
map("n", "]]", ":lua require'illuminate'.goto_next_reference(false)<CR>", { silent = true })
map("n", "[[", ":lua require'illuminate'.goto_prev_reference(false)<CR>", { silent = true })
map("i", "<C-s>", "<esc>:w<CR>", { silent = true })
map("i", "<Tab>", "<Tab>", { silent = true })

