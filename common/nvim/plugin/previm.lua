vim.cmd [[
  autocmd BufRead,BufNewFile *.md  set filetype=markdown
  nnoremap <silent> <C-p> :PrevimOpen<CR>
  let g:previm_enable_realtime=1
]]
