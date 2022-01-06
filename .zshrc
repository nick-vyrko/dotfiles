# ======== ZSH SETTINGS ======== # 

zstyle ':completion:*' menu select # select completions with arrow keys

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
# export WORDCHARS='*?[]~&;!$%^<>'
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/bin:$HOME/.bin"
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

alias tree='tree -C'
alias t='CURRENT_PLATFORM=smart bundle exec rspec'
alias cop='bundle exec rubocop'
alias copdiff='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs bundle exec rubocop'
alias j='jobs'


# ======== KEY BINDINGS ======== # 

bindkey '^ ' autosuggest-accept # zsh-authosuggestions accept suggested


# ======== ENVIRONMENTS ======== # 

# NVM
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm

# RVM
export PATH="$PATH:$HOME/.rvm/bin"

export GPG_TTY=$(tty) # gpg comits signing
export CURRENT_PLATFORM=smart
# export GITHUB_API_TOKEN=<token>

# (sudo sysctl -w net.inet.ip.ttl=65) #increase ttl + 1


# ========== Starship setup ======== #

export STARSHIP_CONFIG=~/.starship/config.toml
eval "$(starship init zsh)"

eval "$(fnm env --use-on-cd)" # fast node versions manager
