return {
	{
		"williamboman/mason.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "mfussenegger/nvim-dap" },
    },
		config = function()
			require("mason-nvim-dap").setup({})
			require("dap").adapters.go = {
				type = "server",
				port = "63370",
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:63370" },
				},
			}
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
				vim.cmd("NvimTreeClose")
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
				vim.cmd("NvimTreeOpen")
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
				vim.cmd("NvimTreeShow")
			end

			vim.cmd("DapLoadLaunchJSON")
		end,
	},

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = true,
	},
}
