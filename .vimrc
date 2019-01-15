" Pathogen plugins
execute pathogen#infect()
syntax on
filetype plugin indent on

set ignorecase "Ignore case in search
set number "turn on line numbers
set pastetoggle=<F5> "remap F5 to paste mode
set showmatch "Highlights matching brackets in programming languages
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set backspace=2  "This makes the backspace key function like it does in other programs.

"SYNTASTIC -------
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_javascript_checkers = ['eslint'] 
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" color scheme
syntax on
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" keep visual selection when indenting/outdenting
vnoremap < <gv
vnoremap > >gv

" remap <leader> to ,
let mapleader = ","

"TABBING---------
set tabstop=2  "How much space Vim gives to a tab
set softtabstop=2 " number of spaces in tab when editing
set smarttab "Improves tabbing
set expandtab " tabs are spaces
set shiftwidth=2  "Assists code formatting

"STATUS LINE--------
set laststatus=2
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

"NERDTree
"start NERDTree in the pwd if vim is started with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-N> :NERDTreeToggle<CR>


"BETTER-JAVASCRIPT-COMPLETION -------------
let g:vimjs#casesensistive = 1
" Enabled by default. flip the value to make completion matches case insensitive

let g:vimjs#smartcomplete = 0
" Disabled by default. Enabling this will let vim complete matches at any location
" e.g. typing 'ocument' will suggest 'document' if enabled.

let g:vimjs#chromeapis = 0
" Disabled by default. Toggling this will enable completion for a number of Chrome's JavaScript extension APIs

let g:javascript_plugin_jsdoc = 1
" enables syntax highlighting for JSDOC

"SEARCHING----------
set path=$PWD/**
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Find<SPACE>

"set the yank to the system clipboard as well, comment out if strange behavior
set clipboard=unnamed

set incsearch

""""""""""""""""""""""""""""""""""""""
" LOCATION LIST AND QUICKFIX WINDOWS "
""""""""""""""""""""""""""""""""""""""
noremap <leader>c :ccl <bar> lcl<CR>

"""""""""""""""""""
" FZF AND RIPGREP "
"""""""""""""""""""
noremap <leader>f :Files ~<CR>

let g:rg_command = '
    \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
    \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
    \ -g "!{.git,node_modules,vendor}/*" '

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
call plug#end()

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
