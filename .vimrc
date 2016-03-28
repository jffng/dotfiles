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

" closetag script
" let g:closetag_html_style=1
" source ~/.vim/scripts/closetag.vim
" if !exists("b:unaryTagsStack") || exists("b:closetag_html_style")
"   if &filetype == "html" || exists("b:closetag_html_style")
"     let b:unaryTagsStacktack="area base br dd dt hr img input link meta param"
"   else " for xml and xsl
"     let b:unaryTagsStack=""
"   endif
" endif
" if !exists("b:unaryTagsStack")
"   let b:unaryTagsStack=""
" endif

"SEARCHING----------
set path=$PWD/**

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" system clipboard bindings
set clipboard=unnamed
