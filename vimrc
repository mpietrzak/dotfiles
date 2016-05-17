
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'VundleVim/Vundle.vim'
Bundle 'ShowTrailingWhitespace'
" Bundle 'scrooloose/syntastic'
" Bundle 'hylang/vim-hy'
Bundle 'rust-lang/rust.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'raichoo/purescript-vim'
Bundle 'elzr/vim-json'

syntax on
filetype plugin indent on

let g:syntastic_haskell_checkers=['ghc_mod', 'hlint']

set rtp+=~/.fzf

set hidden
set ignorecase smartcase
set incsearch nohlsearch
set bs=2
set history=1024

set sts=4 ts=4 sw=4 et

au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai
au FileType html setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai si indentexpr=
au FileType xhtml setlocal ts=4 sts=4 sw=4 et
au FileType xml setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai
au FileType htmldjango setlocal ts=4 sts=4 sw=4 et ai
au FileType javascript setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai
au FileType c setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai
au FileType cpp setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai
au FileType css setlocal ts=4 sts=4 sw=4 et ai
au FileType haskell setlocal ts=4 sts=4 sw=4 et ai

" Those are for Kabira (KPSA)
au BufNewFile,BufRead *.soc setlocal ft=kis
au BufNewFile,BufRead *.act setlocal ft=kis
au BufNewFile,BufRead *.kds setlocal ft=kis
au BufNewFile,BufRead *.osc setlocal ft=kis
au BufNewFile,BufRead *.kes setlocal ft=kis
au BufNewFile,BufRead *.gradle setlocal ft=groovy

set scrolloff=8
set wildmode=longest,list,full
set wildmenu

set wildignore+=*.o,*.obj,.git,*.pyc

if has('gui_running')
        set guifont=Hack:h12
        set guioptions-=m
        set guioptions-=T
        set lines=40
        set columns=128
	set visualbell
	set t_vb=
else
    set bg=dark
endif

if has("gui_macvim")
    macmenu File.New\ Tab key=<nop>
    map <C-Tab> :bn<CR>
    map <C-S-Tab> :bp<CR>
    macmenu File.Print key=<nop>
    map <D-p> :FZF<CR>
else
    map <C-p> :FZF<CR>
endif


