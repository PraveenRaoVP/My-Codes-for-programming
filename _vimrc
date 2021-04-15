syntax on
set number
set guifont=Fixedsys:h18
set clipboard=unnamed
set ai 
set sm
set hls
set shortmess=a
set cmdheight=2
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

let mapleader = ","

autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F10> :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

autocmd filetype java nnoremap <F6> :!javac % 
"autocmd filetype java nnoremap <F7> :!java %< 
autocmd FileType java setlocal omnifunc=javacomplete#Complete
"autocmd Filetype java set makeprg=javac\ %
"set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
"map <F5> :make<Return>:copen<Return>
"map <F11> :cprevious<Return>
"map <F12> :cnext<Return>

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>
inoremap {{ {
inoremap {} {}

inoremap ' ''
inoremap " ""
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew

map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew

if has('python3')
endif 

call plug#begin('~/vimfiles/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'morehetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'ap/vim-buftabline'
Plug 'turbio/bracey.vim'
Plug 'airblade/vim-gitgutter'
Plug 'klen/python-mode'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'maxmellon/vim-jsx-pretty'
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew

call plug#end()
filetype plugin indent on

autocmd VimEnter * NERDTree

let NERDTreeIgnore = ['\.DAT$', '\.LOG1$', '\.LOG1$']
nmap <F2> :NERDTreeToggle<CR>

set tabstop=4
set shiftwidth=4
set softtabstop=4

set expandtab

autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>



set encoding=utf-8
