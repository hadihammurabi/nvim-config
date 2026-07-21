local M = {}

local mini_modules = {
	"mini.comment",
	"mini.bracketed",
	"mini.icons",
	"mini.surround",
	"mini.move",
	"mini.tabline",
	"mini.pairs",
	"mini.files",
	"mini.extra",
	"mini.indentscope",
}
-- local event = { "BufReadPost", "BufNewFile" }
local event = { "VeryLazy" }

for _, mod in ipairs(mini_modules) do
	table.insert(M, {
		"nvim-mini/"..mod,
		version = "*",
		event = event,
		config = function()
			require(mod).setup()
		end,
	})
end

table.insert(M, {
	"nvim-mini/mini.bufremove",
	version = "*",
	event = event,
	config = function()
		require("mini.bufremove").setup({
			silent = true,
		})
	end,
})

table.insert(M, {
	"nvim-mini/mini.pick",
	version = "*",
	event = event,
	config = function()
		require("mini.pick").setup()
		vim.cmd([[
        highlight MiniPickMatchCurrent guibg=#282c34 guifg=#abb2bf gui=bold
        highlight MiniPickCursor guifg=Cyan
      ]])
	end,
})

table.insert(M, {
	"nvim-mini/mini.indentscope",
	version = "*",
	event = event,
	config = function()
		require("mini.indentscope").setup({
			draw = {
				delay = 0,
				animation = require("mini.indentscope").gen_animation.none(),
			},
		})
	end,
})

table.insert(M, {
	"nvim-mini/mini.statusline",
	version = "*",
	event = event,
	config = function()
		local MiniStatusline = require("mini.statusline")
		MiniStatusline.setup({
			content = {
				active = function()
					local _, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local git = MiniStatusline.section_git({ trunc_width = 40 })
					local diff = MiniStatusline.section_diff({ trunc_width = 75 })
					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
					-- local lsp            = MiniStatusline.section_lsp({ trunc_width = 75 })
					-- local filename       = MiniStatusline.section_filename({ trunc_width = 140 })
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
					local location = MiniStatusline.section_location({ trunc_width = 75 })
					-- local search      = MiniStatusline.section_searchcount({ trunc_width = 75 })

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { git } },
						{ hl = "MiniStatuslineDevinfo", strings = { diff, diagnostics } },
						"%<",
						-- { hl = 'MiniStatuslineFilename', strings = { filename } },
						"%=",
						{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
						{ hl = mode_hl, strings = { location } },
					})
				end,
			},
		})
	end,
})

return M
