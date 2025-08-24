require("neotest").setup({
  adapters = {
    require("neotest-python")({
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
    require('neotest-go')({
      args = { '-coverprofile=coverage.out' }
    })
  },
})

vim.keymap.set('n', '<Leader>t', ':lua require("neotest").run.run()<CR>', { desc = 'Run test' })
