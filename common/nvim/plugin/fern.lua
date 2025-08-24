-- open fern
vim.cmd [[
  let g:fern#default_hidden=1
  command! -nargs=* E Fern .
]]

-- vsplit with fern
vim.cmd [[
  command! -nargs=* VS vert botright split | Fern . -reveal=%
  cabbrev vs VS
]]

-- fern-mapping-fzf
vim.cmd[[
  nmap <C-t> <Plug>(fern-action-fzf-files)
  function! Fern_mapping_fzf_customize_option(spec)
      let a:spec.options .= ' --multi'
      " Note that fzf#vim#with_preview comes from fzf.vim
      if exists('*fzf#vim#with_preview')
          return fzf#vim#with_preview(a:spec)
      else
          return a:spec
      endif
  endfunction

  function! Fern_mapping_fzf_before_all(dict)
      if !len(a:dict.lines)
          return
      endif
      return a:dict.fern_helper.async.update_marks([])
  endfunction

  function! s:reveal(dict)
      execute "FernReveal -wait" a:dict.relative_path
      execute "normal \<Plug>(fern-action-mark:set)"
  endfunction

  let g:Fern_mapping_fzf_file_sink = function('s:reveal')
  let g:Fern_mapping_fzf_dir_sink = function('s:reveal')
]]
