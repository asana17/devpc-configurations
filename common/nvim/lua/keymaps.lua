local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',


-- Do not yank with x
keymap("n", "x", '"_x', opts)

-- remove highlight with esc esc
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- automatically insert space after commas
keymap("i", ",", ",<Space>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- exit terminal insert mode with jj
keymap("t", "jj", "<C-\\><c-n>", {silent = true})

-- telescope
vim.keymap.set('n', '<leader>lg', require('telescope.builtin').live_grep)
vim.keymap.set('n', 'ca', vim.lsp.buf.code_action)

-- flutter
vim.keymap.set('n', '<leader>fl', require('telescope').extensions.flutter.commands)
