local dap = require("dap")
local dapui = require("dapui")
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "»" },
    layouts = {
      {
        elements = {
          { id = "watches", size = 0.20 },
          { id = "stacks", size = 0.20 },
          { id = "breakpoints", size = 0.20 },
          { id = "scopes", size = 0.40 },
        },
        size = 64,
        position = "right",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 0.20,
        position = "bottom",
      },
    },
})

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
    args = {"--port", "${port}"},
  }
}

dap.adapters.dart = {
  type = 'executable',
  command = 'dart',    -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
  args = { 'debug_adapter' },
  -- windows users will need to set 'detached' to false
  options = {
    detached = false,
  }
}
dap.adapters.flutter = {
  type = 'executable',
  command = 'flutter',   -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
  args = { 'debug_adapter' },
  -- windows users will need to set 'detached' to false
  options = {
    detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = 'use "jj" to escape',
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch dart",
    dartSdkPath = "/usr/local/flutter/bin/cache/dart-sdk/bin/dart",
    flutterSdkPath = "/usr/local/flutter/bin/flutter",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
  },
  {
    type = "flutter",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = "/usr/local/flutter/bin/cache/dart-sdk/bin/dart",
    flutterSdkPath = "/usr/local/flutter/bin/flutter",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
  }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.listeners.before.event_initialized.dapui_config = function()
  dapui.open()
end

vim.keymap.set('n', '<leader>xd', function() dap = require("dap") dap.close() dap.terminate() dap.close() dapui.close() end, { desc = "Terminate" })
vim.keymap.set('n', '<leader>b', function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoints" })
vim.keymap.set('n', '<leader>c', function() require("dap").continue() end, { desc = "Continue" })
vim.keymap.set('n', '<leader>r', function() require("dap").restart() end, { desc = "Restart" })
vim.keymap.set('n', '<leader>xb', function() require("dap").clear_breakpoints() end, { desc = "Clear Breakpoints" })
vim.keymap.set('n', '<leader>s', function() require("dap").step_into() end, { desc = "Step Into" })
vim.keymap.set('n', '<leader>so', function() require("dap").step_over() end, { desc = "Step Over" })
vim.keymap.set('n', '<leader>sO', function() require("dap").step_out() end, { desc = "Step Out" })
vim.keymap.set('n', '<leader>lb', function() require("dapui").float_element "breakpoints" end, { desc = "List Breakpoints" })
vim.keymap.set('n', '<leader>e', function() require("dapui").eval() end, { desc = "DapUI eval" })
