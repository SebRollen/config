# Enable zsh completion
autoload -Uz compinit && compinit -u
gpgconf --launch gpg-agent
# Prompt for pin to make sure yubikey is working correctly
# TODO: Maybe delete these if no longer needed?
# local serialno=$(gpg-connect-agent 'scd serialno' /bye | awk '{print $3}')
# gpg-connect-agent "scd checkpin $serialno" /bye > /dev/null

homeshick --quiet refresh # Check if homeshick castles have been refreshed recently
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(starship init zsh)"
eval "$(mcfly init zsh)"

source /Users/rollen/.config/broot/launcher/bash/br

fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
source "/opt/homebrew/opt/homeshick/homeshick.sh"

#######################################################################
#                               Aliases                               #
#######################################################################
alias ls=exa
alias veracrypt="/Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt --text"
alias pass='PASSWORD_STORE_ENABLE_EXTENSIONS=true pass'
