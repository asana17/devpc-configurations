require('coverage').setup({
  lang = {
    go = {
      coverage_file = vim.fn.getcwd() .. '/coverage.out',
    }
  }
})
