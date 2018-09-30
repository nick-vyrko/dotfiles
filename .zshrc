fpath=( "$HOME/.zfunctions" $fpath )

autoload -U compinit; compinit
autoload -U promptinit; promptinit
prompt pure

zstyle ':completion:*' menu select

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Colorize terminal
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"


# ALIASES
alias zshconf="subl ~/.zshrc"
# alias tmuxconf="subl ~/.tmux.conf"

alias cdws="cd $HOME/workspaces"
alias cdj="cd $HOME/workspaces/juno"
alias c="clear"

alias l='ls -G'
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

# git related shortcut
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gb="git branch"
alias gbd="git branch -D"
alias gbdo="git push origin --delete"
alias gs="git status"
alias gm="git merge"
alias gp="git push"
alias gpo="git push origin"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gl="git lg"
alias gpuo="git pull origin"
alias gf="git fetch"
alias gback="git undo"
alias grs="git reset --soft"
alias gsth="git stash"

alias b='bundle'
alias be='bundle exec'
alias bi="bundle install"
alias s='subl'

alias tree='tree -C'
alias t='bundle exec rspec'
alias j='jobs'

# Juno Aliases
alias wp-start="./bin/webpack-dev-server --no-hot --no-inline"

export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

bindkey ' ' magic-space
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

bindkey '^[' kill-whole-line

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:$HOME/.bin"

export LANG=en_US.UTF-8
export EDITOR='vim'

eval "$(rbenv init -)"

# Functions
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

mkcd() { mkdir -p "$@" && cd "$_"; }
killjobs() { jobs -p | awk '{split($0,a," "); print a[3]}' | xargs kill }

# NVM, RVM exports
export NVM_DIR=$HOME/.nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PGHOST=localhost

# GITHUB
export GIT_TOKEN=ebe1ae40ccf9ab6f05b5b8daa1d219cfcb3e7fa1

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export GPG_TTY=$(tty)


# (sudo sysctl -w net.inet.ip.ttl=65) #increase ttl + 1