set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

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

call plug#end()
