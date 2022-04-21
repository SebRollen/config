FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
# Enable git (and other?) completion
autoload -Uz compinit && compinit -u
gpgconf --launch gpg-agent
# Prompt for pin to make sure yubikey is working correctly
local serialno=$(gpg-connect-agent 'scd serialno' /bye | awk '{print $3}')
gpg-connect-agent "scd checkpin $serialno" /bye
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="/opt/homebrew/bin:$PATH"
eval "$(starship init zsh)"
eval "$(mcfly init zsh)"

alias ls=exa

source /Users/rollen/.config/broot/launcher/bash/br

fpath=($HOME/.homesick/repos/homeshick/completions $fpath)