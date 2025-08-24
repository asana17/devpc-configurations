local registers = require('registers')
  registers.setup({
    system_clipboard = true,
    trim_whitespace = true,
    hide_only_white_space = true,
    show_register_types = true,
    bind_keys = {
      ["<Tab>"] = registers.move_cursor_down(),
      ["<S-Tab>"] = registers.move_cursor_up(),
    },
    window = {
      max_width = 100,
      highlight_cursorline = true,
      transparency = 30,
    }
  })
