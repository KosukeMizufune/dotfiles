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
call dein#add('justmao945/vim-clang')

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
set pastetoggle=<S-p> " Ctrl + p switches paste mode
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

" 'Shougo/neocomplete.vim' {{{
""""""""""""""""""""""""""""""""""""""""""""""		
let g:neocomplete#enable_at_startup = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {} 
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" }}}
"
" 'justmao945/vim-clang' {{{

" disable auto completion for vim-clang
let g:clang_auto = 0
" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

function! s:get_latest_clang(search_path)
    let l:filelist = split(globpath(a:search_path, 'clang-*'), '\n')
    let l:clang_exec_list = []
    for l:file in l:filelist
        if l:file =~ '^.*clang-\d\.\d$'
            call add(l:clang_exec_list, l:file)
        endif
    endfor
    if len(l:clang_exec_list)
        return reverse(l:clang_exec_list)[0]
    else
        return 'clang'
    endif
endfunction

function! s:get_latest_clang_format(search_path)
    let l:filelist = split(globpath(a:search_path, 'clang-format-*'), '\n')
    let l:clang_exec_list = []
    for l:file in l:filelist
        if l:file =~ '^.*clang-format-\d\.\d$'
            call add(l:clang_exec_list, l:file)
        endif
    endfor
    if len(l:clang_exec_list)
        return reverse(l:clang_exec_list)[0]
    else
        return 'clang-format'
    endif
endfunction

let g:clang_exec = s:get_latest_clang('/usr/bin')
let g:clang_format_exec = s:get_latest_clang_format('/usr/bin')

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'


" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
