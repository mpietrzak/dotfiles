
set nocompatible

call plug#begin('~/.vim/plugged')
" Plug 'Olical/conjure', {'tag': 'v4.8.0'}
" Plug 'alx741/vim-hindent'
" Plug 'cespare/vim-toml'
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'jamessan/vim-gnupg'
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeFocus' }
" Plug 'sheerun/vim-polyglot'
" Plug 'venantius/vim-cljfmt'
" Plug 'vim-scripts/ShowTrailingWhitespace'
Plug 'dense-analysis/ale'
Plug 'joerdav/templ.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
Plug 'nanotech/jellybeans.vim'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
if has('nvim')
    " Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    " Plug 'folke/tokyonight.nvim'
    " Plug 'projekt0n/github-nvim-theme'
    " Plug 'rebelot/kanagawa.nvim'
    " Plug 'rose-pine/neovim', { 'as': 'rose-pine' }
    " Plug 'sainnhe/gruvbox-material'
endif
call plug#end()

filetype plugin indent on
syntax on

set autoread
set bs=2
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
set hidden
set history=1024
set ignorecase smartcase
set incsearch nohlsearch
set list
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

let g:ale_fix_on_save = 1
let g:ale_fixers = {'go': ['gofumpt'], 'rust': ['rustfmt']}
let g:ale_haskell_ormolu_executable = "/Users/mp/.cabal/bin/ormolu"
let g:ale_haskell_ormolu_options="--stdin-input-file ."
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_linters = {
            \ 'clojure': ['clj-kondo'],
            \ 'go': ['gofmt', 'golangci-lint', 'gopls', 'govet', 'staticcheck'],
            \ 'haskell': ['hls'],
            \ 'rust': ['analyzer', 'cargo']
            \ }
let g:ale_open_list = 1
let g:ale_set_highlights = 0
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

set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

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
au FileType haskell setlocal et sts=2 sw=2 ts=2
au FileType html setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai si indentexpr=
au FileType htmldjango setlocal ts=4 sts=4 sw=4 et ai
au FileType javascript setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai
au FileType xhtml setlocal ts=4 sts=4 sw=4 et
au FileType xml setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 ai

" au BufWritePre *.purs :call Preserve("%!purty -")

map <silent> <leader>. :e %:p:h<CR>
map <silent> <leader>b :Buffers<CR>
map <silent> <leader>h :History<CR>
map <silent> <leader>n :NERDTreeFocus<CR>
map <silent> <leader>p :FZF<CR>

hi  NBSP                ctermbg=3
syn match NBSP " "

if has('gui_running')
    colo jellybeans
    set guifont=Menlo:h15
    set guioptions-=m
    set guioptions-=T
    set lines=40
    set columns=128
    set visualbell
    set t_vb=
    " set bg=light
    if has('gui_macvim')
        macmenu File.New\ Tab key=<nop>
        macmenu File.Print key=<nop>
    endif
    let g:neovide_cursor_animation_length = 0.02
else
    " set bg=dark
endif

if has('nvim')
    colo vim
    "colo catppuccin
    "colo jellybeans
endif

