fpath=( "$HOME/.zfunctions" $fpath )

# ======== ZSH SETTINGS ======== # 

autoload -U compinit; compinit
autoload -U promptinit; promptinit
prompt pure

zstyle ':completion:*' menu select # select completions with arrow keys

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:$HOME/Library/Python/3.8/bin:$HOME/.bin"
export LANG=en_US.UTF-8
export EDITOR='vim'

# Colorize terminal
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# History enabling
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

setopt HIST_IGNORE_ALL_DUPS # remove older duplicate entries from history
setopt HIST_REDUCE_BLANKS # remove superfluous blanks from history items
setopt HIST_IGNORE_DUPS # Do not save command line if it's a dup of a previous event
setopt HIST_IGNORE_SPACE # Ignore command lines started with space
# setopt HIST_EXPIRE_DUPS_FIRST
setopt INC_APPEND_HISTORY # save history entries as soon as they are entered
# setopt HIST_FIND_NO_DUPS # While searching through Ctrl+R show no duplicates
# setopt share_history # share history between different instances of the shell

setopt auto_cd # cd by typing directory name if it's not a command
setopt correct # autocorrect commands

# ======== FUNCTIONS ======== #

mkcd() { mkdir -p "$@" && cd "$_"; }


# ======== ALIASES ======== # 
alias reload!='exec "$SHELL" -l'

alias zshconf="vim ~/.zshrc"

alias cdws="cd $HOME/workspaces"
alias cdcp="cd $HOME/workspaces/api"
alias c="clear"


alias l='ls -lG'
alias ll='ls -laFG'

# git related shortcuts
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
alias gfp="git fetch --prune; git prune"
alias gback="git undo"
alias grs="git reset --soft"
alias gsth="git stash"

alias b='bundle'
alias be='bundle exec'
alias bi="bundle install"
# alias s='subl'

alias tree='tree -C'
alias t='CURRENT_PLATFORM=smart bundle exec rspec'
alias cop='bundle exec rubocop'
alias copdiff='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs bundle exec rubocop'
alias j='jobs'


# ======== KEY BINDINGS ======== # 

bindkey '^ ' autosuggest-accept # zsh-authosuggestions accept suggested

# backward and forward word with option+left/right
bindkey '^[^[[D' backward-word
bindkey '^[b' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[f' forward-word

# delete word with ctrl+backspace
bindkey '^[[3;5~' backward-delete-word

# ======== ENVIRONMENTS ======== # 

# NVM
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# RVM
export PATH="$PATH:$HOME/.rvm/bin"


# # =======
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8
# export PGHOST=localhost

# export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export GPG_TTY=$(tty)
export CURRENT_PLATFORM=smart
# export GITHUB_API_TOKEN=<token>

# (sudo sysctl -w net.inet.ip.ttl=65) #increase ttl + 1
