return {
	-- {
	-- 	'tzachar/cmp-tabnine',
	-- 	build = './install.sh',
	-- 	dependencies = 'hrsh7th/nvim-cmp',
	-- },

	{
		"VonHeikemen/lsp-zero.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ 'hrsh7th/cmp-buffer' },
			-- { 'tzachar/cmp-tabnine' },
			{ 'hrsh7th/cmp-path' },
			{ "L3MON4D3/LuaSnip" },
		  { "saadparwaiz1/cmp_luasnip" },
			{ "williamboman/mason.nvim" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({})
			local cmp = require("cmp")
			local ls = require("luasnip")

			cmp.setup({
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					-- { name = "cmp_tabnine" },
					{ name = "path" },
					{ name = "luasnip", option = { show_autosnippets = false } },
				}),

				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<C-Space>"] = cmp.mapping.complete(),
				}),

				snippet = {
					expand = function(args)
						ls.lsp_expand(args.body)
					end,
				},
			})

			local M = {}
			function M.expand_or_jump()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end

			function M.jump_prev()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end

			vim.keymap.set("i", "<c-i>", M.expand_or_jump)
		end,
	},
}
