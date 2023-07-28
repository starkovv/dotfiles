[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(rbenv init - bash)"

eval "$(starship init bash)"

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
