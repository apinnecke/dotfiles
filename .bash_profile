export PATH=~/bin:/usr/local/bin:$HOME/go/bin:$HOME/bin:$PATH
export NODE_ENV=development
export NVM_DIR=~/.nvm
export GIT_MERGE_AUTOEDIT=no
export GOPATH=~/go
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)
export EDITOR="/usr/bin/vim"

alias dc="docker-compose"
alias ll="ls -alh"
alias ga="git add"
alias gaa="git add --all :/"
alias grc="gaa; git rebase --continue"
alias gcm="git commit -s -S ${GIT_COMMIT_GPG_KEY_ID:-} -m"
alias gca="git commit -s -S ${GIT_COMMIT_GPG_KEY_ID:-} --amend"
alias gcan="git commit -s -S ${GIT_COMMIT_GPG_KEY_ID:-} --amend --no-edit"
alias gpr="git pull-request"
alias grom="git rebase origin/master"
alias grod="git rebase origin/develop"
alias gpo="git push origin"
alias gp="git pull --rebase"
alias gpp="gp ; gpo"
alias gd="git diff"
alias gds="git diff --staged"
alias gs="git status"
alias gsa="git stash save"
alias gsp="git stash pop"
alias gf="git fetch --prune && git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"
alias gl="git log --pretty=oneline --abbrev-commit --graph --decorate"
alias gfrs="git flow release start"
alias gfrf="git flow release finish"
alias gfhs="git flow hotfix start"
alias gfhf="git flow hotfix finish"
alias git="hub"
alias dns="sudo killall -HUP mDNSResponder"
alias first_col="awk '{ print \$1 }'"
alias remove_first_line="tail -n +2"
alias second_col="awk '{ print \$2 }'"
alias third_col="awk '{ print \$3 }'"
alias cobra-init="GOPATH=$HOME cobra init ."
alias k="kubectl"
alias tf="terraform"
alias please="sudo"
alias brew-update="brew update && brew upgrade && brew cleanup"
alias go-vendors="go mod download && go mod tidy"

# consuming OS specific configuration/function files
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source "${HOME}/dotfiles/linux.sh"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  source "${HOME}/dotfiles/darwin.sh"
fi

source ~/functions.sh
source ~/liquidprompt

eval "$(direnv hook bash)"

export THEFUCK_REQUIRE_CONFIRMATION=false
eval $(thefuck --alias)
eval $(thefuck --alias FUCK)

source <(kubectl completion bash)

for f in $HOME/dotfiles/customers/*; do
    echoc blue "Including customer config for ${f}"
    source $f
done
