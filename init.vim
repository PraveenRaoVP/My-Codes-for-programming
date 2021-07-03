set clipboard=unnamed
" >> load plugins
call plug#begin(stdpath('data') . 'vimplug')
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'preservim/nerdtree'
    Plug 'lambdalisue/vim-fullscreen'   
    Plug 'preservim/nerdcommenter'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-python']  " list of CoC extensions needed

    Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

    " these two plugins will add highlighting and indenting to JSX and TSX files.
    Plug 'yuezk/vim-js'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'maxmellon/vim-jsx-pretty'
call plug#end()


filetype plugin indent on

colorscheme PaperColor

" basic settings
syntax on
set number
set relativenumber
set ignorecase      " ignore case
set smartcase     " but don't ignore it, when search string contains uppercase letters
set nocompatible
set incsearch        " do incremental searching
set visualbell
set expandtab
set tabstop=4
set wildmenu
set ruler
set smartindent
set shiftwidth=4
set hlsearch
set virtualedit=all
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent
set mouse=a  " mouse support
set autochdir
set scrolloff=7

" set leader key to ,
let g:mapleader=","

" >> NERDTree bindings
let NERDTreeIgnore = ['\.DAT$', '\.LOG1$', '\.LOG1$']
nnoremap <C-t> :NERDTreeToggle <CR>
nnoremap <C-o> :browse oldfiles <CR>
nnoremap ,ntf :NERDTreeFocus <CR>

" >> setup nerdcomment key bindings
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

" >> neovim fullscreen
 let g:fullscreen#start_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 1)"
let g:fullscreen#stop_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 0)"

" >> basic mapping from vim

map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew<CR>



"simple code snippet bindings
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" >> Compiling languages:-
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F10> :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $


" >> pairings
"inoremap {{ {
"inoremap { {<CR><Left><CR>}<Left>     
"inoremap {} {<Right><CR>} 
inoremap ' ''<Left>
inoremap " ""<Left>


set encoding=utf-8
