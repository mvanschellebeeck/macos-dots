export ZSH="/Users/matt/.oh-my-zsh"
export PATH="/Users/matt/miniconda/bin:$PATH"
HISTFILE=~/.histfile
HISTSIZE=
HISTFILESIZE= #infinite file history
SAVEHIST=100000
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
autoload -Uz compinit
compinit

# aliases
alias uni="ssh z5015906@login.cse.unsw.edu.au"
alias grieg="ssh -t z5015906@login.cse.unsw.edu.au ssh grieg"
alias v=nvim
alias vi=nvim
alias vim=nvim
alias pdf=okular
alias ff=firefox
alias emulator='~/Library/Android/sdk/emulator/emulator -avd Pixel_XL_API_29'
alias cat='bat'
alias gd='git diff'
alias gs='git status'
alias ga='git add'
alias gl='git log'

# cheat sheet 
# https://github.com/chubin/cheat.sh#usage
function cheat(){
    curl cheat.sh/$1
}

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# autosuggestions config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
source $ZSH/oh-my-zsh.sh
set -o vi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

