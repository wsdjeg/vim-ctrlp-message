if exists('g:loaded_ctrlp_message') && g:loaded_ctrlp_message
  finish
endif
let g:loaded_ctrlp_message = 1

let s:register_var = {
      \  'init':   'ctrlp#message#init()',
      \  'exit':   'ctrlp#message#exit()',
      \  'accept': 'ctrlp#message#accept',
      \  'lname':  'message',
      \  'sname':  'message',
      \  'type':   'message',
      \  'sort':   0,
      \}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:register_var)
else
  let g:ctrlp_ext_vars = [s:register_var]
endif

function! ctrlp#message#init()
  let s = ''
  redir => s
  silent messages
  redir END
  return split(s, "\n")
endfunc

function! ctrlp#message#accept(mode, str)
  call ctrlp#exit()
  let @" = a:str
endfunction

function! ctrlp#message#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#message#id()
  return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2

