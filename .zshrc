export ZSH=$HOME/.oh-my-zsh

plugins=(git vi-mode tmux tmuxinator zsh-syntax-highlighting shrink-path)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

autoload -U promptinit; promptinit
prompt pure

ZSH_DISABLE_COMPFIX=true

export PATH="/usr/local/opt/ruby/bin:/usr/local/bin:$PATH"
export VISUAL=nvim
export EDITOR="$VISUAL"

alias cat="bat"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help="tldr"
alias iip="curl ifconfig.me"
alias lip="ipconfig getifaddr en0"
alias pjq="pbpaste | jq"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias tkall="tl -F \"#{session_name}\" | xargs -I _ tmux kill-session -t _"
alias top="sudo htop"

