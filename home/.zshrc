FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
# Enable git (and other?) completion
autoload -Uz compinit && compinit -u
gpgconf --launch gpg-agent
# Prompt for pin to make sure yubikey is working correctly
local serialno=$(gpg-connect-agent 'scd serialno' /bye | awk '{print $3}')
gpg-connect-agent "scd checkpin $serialno" /bye

homeshick --quiet refresh # Check if homeshick castles have been refreshed recently
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="/opt/homebrew/bin:$PATH"
eval "$(starship init zsh)"
eval "$(mcfly init zsh)"

alias ls=exa

source /Users/rollen/.config/broot/launcher/bash/br

fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
export HOMESHICK_DIR=/opt/homebrew/opt/homeshick
source "/opt/homebrew/opt/homeshick/homeshick.sh"
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
