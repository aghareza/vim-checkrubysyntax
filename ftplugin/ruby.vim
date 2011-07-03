" Language: Ruby
" Author: Ali Aghareza <aghareza AT gmail DOT com>

if exists("g:loaded_checkrubysyntax") || &cp
    finish
endif
let g:loaded_checkrubysyntax = 1

if !exists('g:checkrubysyntax_nomap')
  autocmd Filetype ruby nnoremap <silent> <buffer> <LocalLeader>rs :CheckRubySyntax<CR>
endif

function! s:CheckRubySyntax()
  let result = system('ruby -c '.expand('%'))
  if result =~ 'Syntax OK'
    echo result
  else
    echohl WarningMsg | echo result | echohl None
  end
endfunction

command! -nargs=0 CheckRubySyntax :call s:CheckRubySyntax()
