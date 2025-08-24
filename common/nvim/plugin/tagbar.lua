vim.cmd [[
  nmap <F8> : TagbarToggle<CR>
  let g:tagbar_type_css = {
  \ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
  \ }
  let g:tagbar_type_markdown = {
    \ 'ctagstype'	: 'markdown',
    \ 'kinds'		: [
      \ 'c:chapter:0:1',
      \ 's:section:0:1',
      \ 'S:subsection:0:1',
      \ 't:subsubsection:0:1',
      \ 'T:l4subsection:0:1',
      \ 'u:l5subsection:0:1',
    \ ],
    \ 'sro'			: '""',
    \ 'kind2scope'	: {
      \ 'c' : 'chapter',
      \ 's' : 'section',
      \ 'S' : 'subsection',
      \ 't' : 'subsubsection',
      \ 'T' : 'l4subsection',
    \ },
    \ 'scope2kind'	: {
      \ 'chapter' : 'c',
      \ 'section' : 's',
      \ 'subsection' : 'S',
      \ 'subsubsection' : 't',
      \ 'l4subsection' : 'T',
    \ },
  \ }
  let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
  \}
  let g:tagbar_type_yaml = {
    \ 'ctagstype' : 'yaml',
    \ 'kinds' : [
        \ 'a:anchors',
        \ 's:section',
        \ 'e:entry'
    \ ],
  \ 'sro' : '.',
    \ 'scope2kind': {
      \ 'section': 's',
      \ 'entry': 'e'
    \ },
    \ 'kind2scope': {
      \ 's': 'section',
      \ 'e': 'entry'
    \ },
    \ 'sort' : 0
    \ }
]]
