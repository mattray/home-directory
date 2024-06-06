# Used for setting user's interactive shell configuration and executing commands, will be read when starting as an interactive shell.
# For simplicity’s sake, you should use just one file. The common choice is .zshrc.

# https://www.emacswiki.org/emacs/TrampMode#h5o-9
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '

# share history across multiple zsh sessions
# setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# add commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications, remove older commands
setopt HIST_IGNORE_ALL_DUPS
# remove commandwhen the first character on the line is a space
setopt HIST_IGNORE_SPACE
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

umask 077

# emacs M-x shell
if [[ "dumb" == $TERM ]] ; then
  alias cat='bat -P --style=header,grid --wrap=never'
  alias l='bat -P --style=header,grid --wrap=never'
  alias less='bat -P --style=header,grid --wrap=never'
  alias m='bat -P --style=header,grid --wrap=never'
  alias more='bat -P --style=header,grid --wrap=never'
  export PAGER='bat -P --style=grid --wrap=never'
  export GIT_PAGER='bat -P --style=plain --wrap=never'

  export TERM=xterm-256color
else
  export PAGER='bat --style=header,grid'
  export GIT_PAGER='bat -P --style=plain --wrap=never'
  alias cat='bat'
  alias l='bat'
  alias m='bat'
fi

 # Some more alias to avoid making mistakes:
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias cl='clear'
alias gzh='grep /Users/mattray/.zsh_history -e'
alias grep="grep --color=auto"

# ls/eza
alias ls="eza --color=always -aF"
alias ls1="eza --color=always -1aF"
alias lsa="eza --color=always -alF"
alias lsr="eza --color=always -s modified -alF"

# git
alias gitb="git branch" #list branches
alias gitco="git co" #checkout
alias gitd="git diff --patience" #diff
alias gitdc="git diff --cached" #diff original
alias gitdh="git diff HEAD"  #diff head
alias gitl="git log --oneline --decorate -20 --reverse" #just the last 20 logs
alias gitls="git log --stat --decorate -20 --reverse" #just the last 20 logs with stats
alias gitr="git checkout --" #revert
alias gits="git status -s" #short status
alias gits\?="git status -s | grep -v \?\?" #ignore unknowns
alias gitst="git status" #long status
alias gitus="git unstage" #unstage a change alias was set with 'git config --global alias.unstage "reset HEAD"'

export GIT_EDITOR=$EDITOR

# linux
if [[ $OSTYPE == "linux-gnu"* ]]; then
  export PATH=/opt/chef-workstation/bin:/opt/chef-workstation/embedded/bin:/usr/local/bin:$PATH
# macos
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Atlassian's Sourcetree is a good replacement
  alias gitx="stree"

  #show the file in OSX Finder
  alias reveal="open -R"

  #notification message
  alias ndone='terminal-notifier -title COMPLETED -message "`date`" -sound default >> /dev/null'

  . ~/.creds

  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

eval "$(starship init zsh)"
[[ /opt/homebrew/bin/kubectl ]] && source <(kubectl completion zsh) # add autocomplete permanently to your zsh shell

alias k='kubectl'
alias ka='kubectl apply'
alias kd='kubectl describe'
alias kg='kubectl get'
alias kge='kubectl get events --sort-by=.metadata.creationTimestamp'
alias kl='kubectl logs'
# short alias to set/show context/namespace (only works for bash and bash-compatible shells, current context to be set before using kn to set namespace)
alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'
alias kube-hermes='export KUBECONFIG=/Users/mattray/.kube/hermes-k3s.yaml'
alias kube-kc-aks='export KUBECONFIG=/Users/mattray/.kube/kc-azure.yaml'
alias kube-kc-aws='export KUBECONFIG=/Users/mattray/.kube/kc-aws.json'
alias kube-kc-aws-test='export KUBECONFIG=/Users/mattray/.kube/kc-aws-test.json'
alias kube-kc-gke='export KUBECONFIG=/Users/mattray/.kube/kc-gke.yaml'
alias kube-kind='export KUBECONFIG=/Users/mattray/.kube/kind.yaml'
alias kube-larry='export KUBECONFIG=/Users/mattray/.kube/larry-k3s.yaml'
alias kube-mom='export KUBECONFIG=/Users/mattray/.kube/mom-k3s.yaml'
alias kube-panucci='export KUBECONFIG=/Users/mattray/.kube/panucci-k3s.yaml'
alias kube-walt='export KUBECONFIG=/Users/mattray/.kube/walt-k3s.yaml'
alias kube-yancy='export KUBECONFIG=/Users/mattray/.kube/yancy-k3s.yaml'

export AWS_PROFILE=EngineeringDeveloper

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
