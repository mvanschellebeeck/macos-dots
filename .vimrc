call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'aswathkk/darkscene.vim'
Plug 'lambdalisue/vim-manpager'
Plug 'preservim/nerdtree' 
Plug 'scrooloose/nerdcommenter' 
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'dart-lang/dart-vim-plugin'
Plug 'reisub0/hot-reload.vim'

call plug#end()

" general settings
set nobackup
set nowritebackup
set noswapfile
set number
set mouse=a 
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set nowrap
set cursorline
set termguicolors
set hidden
set noshowmode
syntax enable
set encoding=utf8
filetype plugin on
set splitbelow
set splitright

" darkscene
colorscheme onedark

" cursorline
" hi CursorLine term=bold cterm=bold guibg=Grey40

" mappings
let mapleader=' '

" No Esc thanks
inoremap jk <esc>
inoremap <esc> <nop>
vnoremap <esc> <esc>

" Editing vimrc
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

nnoremap <C-N> :NERDTreeToggle<cr>
nnoremap <C-L> :call BNext()<CR>
inoremap <C-L> <esc>:call BNext()<CR>
nnoremap <C-H> :call BPrev()<CR>
inoremap <C-H> <esc>:call BPrev()<CR>
nnoremap <C-D> :bp\|bd #<CR>
inoremap <C-D> <esc>:bp\|bd #<CR>
vnoremap < <gv
vnoremap > >gv

" remove highlight
nnoremap <Leader><Space> :nohlsearch<CR>

" Copy and paste
nnoremap <Leader>p "*p
vnoremap <Leader>c "+y

" indentLine
let g:indentLine_first_char = '|'
let g:indentLine_char = '|'
let g:indentLine_showFirstIndentLevel = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:lightline#bufferline#shorten_path = 0

" nerdtree
" let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git$']
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" leave nerd tree open on first file select
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeToggle | endif
" handle nerd tree buffer clsoe properly
nnoremap <leader>ct :bp<cr>:bd #<cr>

" nerdcommenter
let g:NERDSpaceDelims = 1
nnoremap <C-_> :call NERDComment('Toggle', 'Toggle')<CR>
inoremap <C-_> <esc>:call NERDComment('Toggle', 'Toggle')<CR>
vnoremap <C-_> :call NERDComment('Toggle', 'Toggle')<CR>gv

" ALE
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

" gitgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added                     = '┃'
let g:gitgutter_sign_modified                  = '┃'
let g:gitgutter_sign_removed                   = '┃'
let g:gitgutter_sign_removed_first_line        = '┃'
let g:gitgutter_sign_modified_removed          = '┃'

" vim-tags
let g:vim_tags_auto_generate = 1

" FZF
nnoremap <silent> <C-p> :call FZFOpen(':FZF')<CR>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" NERDTree
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

nnoremap <C-F> :Rg<Cr>

" coc
set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-emmet',
    \ 'coc-css',
    \ 'coc-python',
    \ 'coc-prettier',
    \ 'coc-flutter',
    \ 'coc-rls'
\ ]

set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'onedark'
    \ }


set showtabline=2
let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#shorten_ath = 0


if !has('gui_running')
  set t_Co=256
endif

" Coc gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

" Coc helpers
nmap <leader>rn <Plug>(coc-rename)
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word

" Some function Hacks to avaoid issue I face with NERDTree
function! BNext()
    if (expand('%') =~ 'NERD_tree')
        :exe "normal \<C-W>\<C-w>"
    endif
    :bn
endfunction

function! BPrev()
    if (expand('%') =~ 'NERD_tree')
        :exe "normal \<c-w>\<c-w>"
    endif
    :bp
endfunction

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

