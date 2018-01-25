syntax on
set number
set smartindent
set tabstop=4
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
set wrap
set showcmd
set whichwrap=b,s,h,l,<,>,~,[,]
set showmatch
set matchtime=1
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

