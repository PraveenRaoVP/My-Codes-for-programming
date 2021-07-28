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
    Plug 'junegunn/fzf',{'do':{ -> fzf#install() } } 
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

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
set clipboard=unnamedplus
" set leader key to ,
let g:mapleader=","

" >> NERDTree bindings
let NERDTreeIgnore = ['\.DAT$', '\.LOG1$', '\.LOG1$']
nnoremap <C-t> :NERDTreeToggle <CR>
nnoremap <C-o> :browse oldfiles <CR>
nnoremap ,ntf :NERDTreeFocus <CR>
nnoremap <C-r> :NERDTreeRefreshRoot <CR>

" >> setup nerdcomment key bindings
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1

" >> neovim fullscreen
 let g:fullscreen#start_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 1)"
let g:fullscreen#stop_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 0)"

" >> basic mapping from vim

map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew<CR>

"highlight codes
hi Comment ctermfg=LightBlue



"simple code snippet bindings

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


" >>FZF and vim-rooter config
 " This is the default extra key bindings
let g:fzf_action = {'ctrl-t': 'tab split','ctrl-x': 'split','ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors ={ 'fg':      ['fg', 'Normal'], 'bg':      ['bg', 'Normal'], 'hl':      ['fg', 'Comment'], 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'], 'bg+':     ['bg', 'CursorLine', 'CursorColumn'], 'hl+':     ['fg', 'Statement'], 'info':    ['fg', 'PreProc'], 'border':  ['fg', 'Ignore'], 'prompt':  ['fg', 'Conditional'], 'pointer': ['fg', 'Exception'], 'marker':  ['fg', 'Keyword'], 'spinner': ['fg', 'Label'], 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0,fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


" >> bg manipulation for transparent
highlight Normal ctermbg=none
highlight NonText ctermbg=none


set encoding=utf-8 
