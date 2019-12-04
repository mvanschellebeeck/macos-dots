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

" Regular expressions
set magic

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

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
set background=dark
"colorscheme solarized 

" Syntax highlighting
syntax enable

" Ctrl+h to stop searching
" nnoremap jk :noh<return><esc>

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

" Vim history (git)
augroup custom_backup
  autocmd!
  autocmd BufWritePost * call BackupCurrentFile()
augroup end

let s:custom_backup_dir='~/.vim_custom_backups'
function! BackupCurrentFile()
  if !isdirectory(expand(s:custom_backup_dir))
    let cmd = 'mkdir -p ' . s:custom_backup_dir . ';'
    let cmd .= 'cd ' . s:custom_backup_dir . ';'
    let cmd .= 'git init;'
    call system(cmd)
  endif
  let file = expand('%:p')
  if file =~ fnamemodify(s:custom_backup_dir, ':t') | return | endif
  let file_dir = s:custom_backup_dir . expand('%:p:h')
  let backup_file = s:custom_backup_dir . file
  let cmd = ''
  if !isdirectory(expand(file_dir))
    let cmd .= 'mkdir -p ' . file_dir . ';'
  endif
  let cmd .= 'cp ' . file . ' ' . backup_file . ';'
  let cmd .= 'cd ' . s:custom_backup_dir . ';'
  let cmd .= 'git add ' . backup_file . ';'
  let cmd .= 'git commit -m "Backup - `date`";'
  call jobstart(cmd)
endfunction

noremap <silent> <leader>obk :call BackupHistory()<cr>

function! BackupHistory()
  let backup_dir = expand(s:custom_backup_dir . expand('%:p:h'))
  let cmd = 'tmux split-window -h -c "' . backup_dir . '"\; '
  let cmd .= 'send-keys "git log --patch --since=\"1 month ago\" ' . expand('%:t') . '" C-m'
  call system(cmd)
endfunction

nmap <F2> <Plug>(coc-rename)
" My mappings

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

nnoremap <D-c> "+y
vnoremap <D-c> "+y

" git gutter
let g:gitgutter_git_executable = '/usr/bin/git'
