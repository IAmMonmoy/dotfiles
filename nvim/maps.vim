" Description: Keymaps

let mapleader=","

" Maintain selection after indenting
vnoremap > >gv
vnoremap < <gv

nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

"nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Resize split
nmap <leader>q <plug>(QuickScopeToggle)
nnoremap <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" Move window
nmap <Space> <C-w>w
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" floaterm config
nnoremap   <silent>    tn   :FloatermNew<CR>
tnoremap   <silent>    tn    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>    tp   :FloatermPrev<CR>
tnoremap   <silent>    tp    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>    tN   :FloatermNext<CR>
tnoremap   <silent>    tN    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>    tt   :FloatermToggle<CR>
tnoremap   <silent>    tk   <C-\><C-n>:FloatermKill<CR>
nnoremap   <silent>    tk   :FloatermKill<CR>
nmap       <silent>    ts   :FloatermSend
tnoremap   <silent>    tt   <C-\><C-n>:FloatermToggle<CR>

" Custom terminal config
tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>
noremap <C-v><Esc> <Esc>
noremap tv :below vertical terminal<CR>

" switching windows
 " Terminal mode:
tnoremap <C-h> <c-\><c-n><c-w>h
tnoremap <C-j> <c-\><c-n><c-w>j
tnoremap <C-k> <c-\><c-n><c-w>k
tnoremap <C-l> <c-\><c-n><c-w>l
" Insert mode:
inoremap <C-h> <Esc><c-w>h
inoremap <C-j> <Esc><c-w>j
inoremap <C-k> <Esc><c-w>k
inoremap <C-l> <Esc><c-w>l
" Visual mode:
vnoremap <C-h> <Esc><c-w>h
vnoremap <C-j> <Esc><c-w>j
vnoremap <C-k> <Esc><c-w>k
vnoremap <C-l> <Esc><c-w>l
" Normal mode:
nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l

" quickscope toggle
nmap <leader>q <plug>(QuickScopeToggle)
xmap <leader>q <plug>(QuickScopeToggle)

" Test config
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" source vim
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>mb :MetalsImportBuild<CR>


" copy to clipboard
nnoremap Y "+y
vnoremap Y "+y
nnoremap yY ^"+y$

nnoremap <leader>S :set spell!<CR>
inoremap <leader>S <C-O>:set spell!<CR>
