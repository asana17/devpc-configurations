vim.cmd[[
  " press <Tab> to expand or jump in a snippet. These can also be mapped separately
  " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
  imap <silent><expr> <C-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-k>'
  " -1 for jumping backwards.
  inoremap <silent> <C-b> <cmd>lua require'luasnip'.jump(-1)<Cr>

  snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(1)<Cr>
  snoremap <silent> <C-b> <cmd>lua require('luasnip').jump(-1)<Cr>

  " For changing choices in choiceNodes (not strictly necessary for a basic setup).
  imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
  smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]

require("luasnip.loaders.from_snipmate").lazy_load()
