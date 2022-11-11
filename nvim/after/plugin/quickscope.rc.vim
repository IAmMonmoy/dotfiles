let g:qs_highlight_on_keys = ['f', 'F']
let g:qs_max_chars=80
let g:qs_enable=0
let g:qs_hi_priority = 2
let b:qs_local_disable=1
let g:qs_lazy_highlight = 1
"let g:qs_delay = 0


augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
