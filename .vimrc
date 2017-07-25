" Pathogen plugins
execute pathogen#infect()
syntax on
filetype plugin indent on

"Ignore case in search
set ignorecase
"turn on line numbers
set number

" color scheme
syntax on
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
" function! ToggleBackground()
"   if (w:solarized_style=="dark")
"   let w:solarized_style="light"
"   colorscheme solarized
" else
"   let w:solarized_style="dark"
"   colorscheme solarized
" endif
" endfunction
" command! Togbg call ToggleBackground()
" nnoremap <F5> :call ToggleBackground()<CR>
" inoremap <F5> <ESC>:call ToggleBackground()<CR>a
" vnoremap <F5> <ESC>:call ToggleBackground()<CR>

"TABBING---------
set tabstop=4  "How much space Vim gives to a tab
set softtabstop=4 " number of spaces in tab when editing
set smarttab "Improves tabbing
set expandtab " tabs are spaces
set shiftwidth=4  "Assists code formatting

"NERDTree
"start NERDTree in the pwd if vim is started with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-N> :NERDTreeToggle<CR>

"SEARCHING----------
set path=$PWD/**

" The Silver Searcher
" if executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"   let g:ctrlp_use_caching = 0
" endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Find<SPACE>

" system clipboard bindings
set clipboard=unnamed

" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

call plug#end()

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
