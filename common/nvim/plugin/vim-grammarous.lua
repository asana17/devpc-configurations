vim.cmd [[
  let g:grammarous#enable_spell_check=1
  let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }
  let g:grammarous#jar_url = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'

  let g:grammarous#hooks = {}
  function! g:grammarous#hooks.on_check(errs) abort
      nmap <buffer> n <Plug>(grammarous-move-to-next-error)
      nmap <buffer> p <Plug>(grammarous-move-to-previous-error)
      nmap <buffer> <C-f> <Plug>(grammarous-fixit)
      nmap <buffer> <C-r> <Plug>(grammarous-remove-error)
  endfunction

  function! g:grammarous#hooks.on_reset(errs) abort
      nunmap <buffer> n
      nunmap <buffer> p
      nunmap <buffer> <C-f>
      nunmap <buffer> <C-r>
  endfunction
]]
