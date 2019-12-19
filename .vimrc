let mapleader=" "
" Sets how many lines of history VIM has to remember
set history=500

" Show file modifications from outside this window
set autoread

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
set encoding=utf8

" Command <TAB> automcomplete
set wildmenu

" Line numbering
set number

" Highlight current line
set cursorline

" Fix search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Tabs
set showtabline=2

" Regular expressions
set magic

" Set 1 tab to 2 spaces
set tabstop=2
set shiftwidth=2

" Use spaces instead of tabs
set expandtab
set smarttab

" Smart indenting and wrapping
set ai
set si
set wrap

" Make backspace work normally
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Theme
"set background=dark
"colorscheme solarized 

" Syntax highlighting
syntax enable

" Automatically reload .vimrc on update
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" Finding files in vim
set path+=**
set wildignore+=**/node_modules/**


" NERDTree
noremap <C-n> :NERDTreeToggle %<CR>
noremap <C-m> :NERDTreeFocus<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" NERDCommenter
nnoremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>

let g:NERDCustomDelimiters = { 'javascript.jsx': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' } }
let g:NERDTreeIgnore = ['^node_modules$', '^package-lock.json']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


command! -nargs=0 Prettier :CocCommand prettier.formatFile

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let g:indentguides_tabchar = '|'
let g:indentguides_spacechar = '|'

" lightline
nmap <leader>rn <Plug>(coc-rename)

" word to uppercase
nnoremap <c-u> viwU

" vimrc mappings
:nnoremap <leader>ev :vsplit ~/.vimrc<cr>
:nnoremap <leader>sv :source ~/.vimrc<cr>

" quoting!
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
:nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" no Esc thanks
:inoremap jk <esc>
:inoremap <esc> <nop>
:vnoremap <esc> <esc>

" no arrow keys sir!
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>

"inoremap <Up> <nop>
"inoremap <Down> <nop>
"inoremap <Left> <nop>
"inoremap <Right> <nop>

" better vim splits
set splitbelow
set splitright

" vim split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" autoindent python files pls
":autocmd BufWritePre,BufRead *.py :normal gg=G

nnoremap <leader>c "+y
vnoremap <leader>c "+y

" git gutter
let g:gitgutter_git_executable = '/usr/bin/git'

" rust tooling
let g:rustfmt_autosave = 1

" lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }

" set noshowmode
if !has('gui_running')
  set t_Co=256
endif

" intellisensce (coc.nvim)
highlight Pmenu ctermbg=white guibg=white
set updatetime=300
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter' 
Plug 'thaerkh/vim-indentguides'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elzr/vim-json'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/c.vim'
Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'

call plug#end()
