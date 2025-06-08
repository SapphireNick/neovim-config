return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()
    require("dap-go").setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<Leader>dr", function()
      dap.repl.open()
    end, { desc = "Debug: Open REPL" })
    vim.keymap.set("n", "<Leader>dc", function()
      dap.continue()
    end)
    vim.keymap.set("n", "<Leader>ds", function()
      dap.step_over()
    end)
    vim.keymap.set("n", "<Leader>di", function()
      dap.step_into()
    end)
    vim.keymap.set("n", "<Leader>do", function()
      dap.step_out()
    end)
    vim.keymap.set("n", "<Leader>db", function()
      dap.toggle_breakpoint()
    end)
    vim.keymap.set("n", "<Leader>dl", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end)
  end,
}
