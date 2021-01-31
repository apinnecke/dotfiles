source /etc/profile.d/bash_completion.sh

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

if [ -d "/home/alex/src/github.com/derailed/k9s" ]; then
  alias k9s="/home/alex/src/github.com/derailed/k9s/execs/k9s"
fi

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
