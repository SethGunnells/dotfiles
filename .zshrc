ZSH_THEME=""
export ZSH=$HOME/.oh-my-zsh

MODE_INDICATOR=""
plugins=(git tmux zsh-syntax-highlighting shrink-path zsh-vim-mode)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -U promptinit; promptinit
prompt pure

ZSH_DISABLE_COMPFIX=true

export VISUAL=nvim
export EDITOR="$VISUAL"

alias cat="bat"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias gcob="git checkout \$(git branch | fzf)"
alias gsl="git status --long"
alias pjq="pbpaste | jq"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias tkall="tl -F \"#{session_name}\" | xargs -I _ tmux kill-session -t _"
alias top="sudo htop"

source /Users/seth.gunnells/.config/broot/launcher/bash/br
source ~/.localrc.zsh
