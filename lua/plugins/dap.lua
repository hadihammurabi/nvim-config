return {
	{
		"mfussenegger/nvim-dap",
		event = "BufRead",
	},

	{
		"rcarriga/nvim-dap-ui",
		event = "BufRead",
		config = function()
			require("dapui").setup({
				layouts = {
					{
						position = "left",
						size = 40,
						elements = {
							-- {
							--   id = "breakpoints",
							--   size = 0.10,
							-- },
							-- {
							--   id = "stacks",
							--   size = 0.25,
							-- },
							-- {
							--   id = "watches",
							--   size = 0.25,
							-- },
							-- {
							--   id = "scopes",
							--   size = 0.40,
							-- },
						},
					},
					{
						position = "bottom",
						size = 15,
						elements = {
							-- {
							--  id = "console",
							--  size = 0.5,
							-- },
							{
								id = "repl",
								size = 0.5,
							},
						},
					},
				},
			})
		end,
	},

}
