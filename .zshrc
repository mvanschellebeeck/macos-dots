export ZSH="/Users/matt/.oh-my-zsh"

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
alias cat='bat'
alias gd='git diff'
alias gs='git status'
alias ga='git add'
alias gl='git log'
alias gc='git commit'
alias gp='git push'
alias define='dict'
alias c='clear'
alias ta='tmux attach -t'

# Console services
# https://github.com/chubin/awesome-console-services#Text-Sharing
function cheat(){ curl cheat.sh/$1 }
function weather() { curl wttr.in/$1 }
function ip() { curl l2.io/ip }

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

# vim bindings
set -o vi

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
