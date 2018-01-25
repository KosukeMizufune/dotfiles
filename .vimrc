" dein.vim
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

" General Settings
syntax on
set number
set smartindent
set tabstop=4
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
set wrap
set showcmd
set whichwrap=b,s,h,l,<,>,~,[,]
set showmatch " display corresponding parenthness
set matchtime=1
set pastetoggle=<C-p> " Ctrl + p switches paste mode
set incsearch " incremental search
source $VIMRUNTIME/macros/matchit.vim " extend '%'

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
inoremap < <><LEFT>


