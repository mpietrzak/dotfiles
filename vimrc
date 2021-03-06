set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ShowTrailingWhitespace'
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
call vundle#end()
filetype plugin indent on
syntax on

let g:ale_open_list = 1
let g:vim_json_syntax_conceal = 0

set bs=2
set hidden
set history=1024
set ignorecase smartcase
set incsearch nohlsearch
set mouse=
set noswapfile
set scrolloff=8
set sts=4
set sw=4 et
set ts=4
set wildignore+=*.o,*.obj,.git,*.pyc
set wildmenu
set wildmode=longest,list,full

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
au BufNewFile,BufRead *.gradle setlocal ft=groovy
au BufNewFile,BufRead *.crs setlocal ft=rust


if has('gui_running')
    set guifont=Hack:h12
    set guioptions-=m
    set guioptions-=T
    set lines=40
    set columns=128
    set visualbell
    set t_vb=
    set bg=light
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
    map <C-t> :bn<CR>
    map <C-S-t> :bp<CR>
    map <C-p> :FZF<CR>
endif

if filereadable($HOME . "/opt/homebrew/opt/fzf/plugin/fzf.vim")
    set rtp+=~/opt/homebrew/opt/fzf
endif

if filereadable($HOME . "/.fzf/plugin/fzf.vim")
    set rtp+=~/.fzf
endif

