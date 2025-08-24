vim.g.copilot_no_tab_map = true

local keymap = vim.keymap.set
keymap(
  "i",
  "<C-g>",
  'copilot#Accept("<CR>")',
  { silent = true, expr = true, script = true, replace_keycodes = false }
)
