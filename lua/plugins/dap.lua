return {
  {
    "mfussenegger/nvim-dap",
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
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
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      vim.cmd("DapLoadLaunchJSON")

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
