" dein.vim
"""""""""""""""""""""""""""""
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/unite.vim')

call dein#end()
""""""""""""""""""""""""""""""

" General Settings
""""""""""""""""""""""""""""""
syntax on
set number
set smartindent
set tabstop=4
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
set ruler " display number of rows and character
set title
set wrap
set showcmd "display typing command
set whichwrap=b,s,h,l,<,>,~,[,]
set showmatch " display corresponding parenthness
set matchtime=1
set pastetoggle=<C-q> " Ctrl + p switches paste mode
set incsearch " incremental search
source $VIMRUNTIME/macros/matchit.vim " extend '%'
""""""""""""""""""""""""""""""

" keymapping
"""""""""""""""""""""""
" Traverse even in insert mode 
inoremap <C-j>  <down>
inoremap <C-k>  <up>
inoremap <C-h>  <left>
inoremap <C-l>  <right>

" Normal mode key mapping
noremap <S-h> ^   
noremap <S-l> $     

" Code Completion
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap [ []<LEFT>
""""""""""""""""""""""""""""""""""""""""""

" change color of status bar in insert mode
""""""""""""""""""""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""


" Unit.vim
""""""""""""""""""""""""""""""
" Start from insert mode
let g:unite_enable_start_insert=1
" list of buffer
noremap <C-P> :Unite buffer<CR>
" list of file
noremap <C-N> :Unite -buffer-name=file file<CR>
" list of recent file
noremap <C-Z> :Unite file_mru<CR>
" sources is current directory
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" divide window
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" divide window vertically
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" push <esc> second time means finish
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"""""""""""""""""""""""""""""

