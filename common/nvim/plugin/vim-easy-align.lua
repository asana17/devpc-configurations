local keymap = vim.keymap.set
keymap(
  "n",
  "ga",
  "<Plug>(EasyAlign)",
  { noremap = false, silent = true }
)
