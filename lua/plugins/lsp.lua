return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local on_attach = function(client, bufnr)
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
				-- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
				-- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
				-- vim.keymap.set('n', '<leader>wl', function()
				--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				-- end, bufopts)

				local wk = require("which-key")
				wk.register({
					["<leader>l"] = { name = "+LSP" },
					["<leader>lD"] = { ":lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
					["<leader>ld"] = { ":lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
					["<leader>lt"] = { ":lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
					["<leader>lr"] = { ":lua vim.lsp.buf.rename()<CR>", "Rename All" },
					["<leader>la"] = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
					["<leader>lf"] = { ":lua vim.lsp.buf.format({ async = true })<CR>", "Format" },
				})
			end

			local lsp = require("lspconfig")
			lsp.gopls.setup({
				on_attach = on_attach,
			})
			lsp.rust_analyzer.setup({
				on_attach = on_attach,
				cmd = {
					"rustup",
					"run",
					"stable",
					"rust-analyzer",
				},
			})
		end,
	},
}
