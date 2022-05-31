
set nocompatible

call plug#begin('~/.vim/plugged')

" Plug 'Olical/conjure', {'tag': 'v4.8.0'}
" Plug 'alx741/vim-hindent'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'cespare/vim-toml'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeFocus' }
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/ShowTrailingWhitespace'

call plug#end()

filetype plugin indent on
syntax on

set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
set autoread
set bs=2
set hidden
set history=1024
set ignorecase smartcase
set incsearch nohlsearch
set mouse=
set noswapfile
set ruler
set scrolloff=8
set sts=4
set sw=4 et
set ts=4
set wildignore+=*.o,*.obj,.git,*.pyc
set wildmenu
set wildmode=longest,list,full

let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_linters = {'rust': ['analyzer', 'cargo', 'rls']}
let g:ale_open_list = 1
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_sign_column_always = 0
let g:haskell_indent_case = 4
let g:haskell_indent_do = 4
let g:haskell_indent_guard = 4
let g:haskell_indent_if = 4
let g:haskell_indent_in = 4
let g:haskell_indent_let = 4
let g:haskell_indent_where = 4
let g:purescript_indent_case = 2
let g:purescript_indent_do = 2
let g:purescript_indent_if = 2
let g:rustfmt_autosave = 1
let g:vim_json_syntax_conceal = 0
let mapleader = "\<space>"

" preserve function
if !exists('*Preserve')
    function! Preserve(command)
        try
            let l:win_view = winsaveview()
             "silent! keepjumps keeppatterns execute a:command
            silent! execute 'keeppatterns keepjumps ' . a:command
        finally
            call winrestview(l:win_view)
        endtry
    endfunction
endif

au BufEnter * syntax sync minlines=4096
au BufNewFile,BufRead *.crs setlocal ft=rust
au BufNewFile,BufRead *.gradle setlocal ft=groovy
au FileType c setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai
au FileType cpp setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai
au FileType css setlocal ts=4 sts=4 sw=4 et ai
au FileType haskell setlocal ts=4 sts=4 sw=4 et
au FileType html setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai si indentexpr=
au FileType htmldjango setlocal ts=4 sts=4 sw=4 et ai
au FileType javascript setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai
au FileType xhtml setlocal ts=4 sts=4 sw=4 et
au FileType xml setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai

map <silent> <leader>b :Buffers<CR>
map <silent> <leader>h :History<CR>
map <silent> <leader>n :NERDTreeFocus<CR>
map <silent> <leader>p :FZF<CR>

if has('gui_running')
    set guifont=Menlo:h12
    set guioptions-=m
    set guioptions-=T
    set lines=40
    set columns=128
    set visualbell
    set t_vb=
    set bg=light
    macmenu File.New\ Tab key=<nop>
    macmenu File.Print key=<nop>
else
    set bg=dark
endif

