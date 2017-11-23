scriptencoding utf-8

function! s:open_atom(file)
  let f = len(a:file) > 0 ? fnamemodify(a:file, ':p') : expand('%:p')
  if has("win32") || has("win64")
    silent exec "!start cmd /c call atom " . shellescape(f)
  else
    silent exec "!atom " . shellescape(f) " &"
  endif
endfunction

command! -nargs=? -complete=file OpenAtom call s:open_atom(<q-args>)
