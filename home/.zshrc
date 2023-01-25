# Enable zsh completion
autoload -Uz compinit && compinit -u
gpgconf --launch gpg-agent

homeshick --quiet refresh # Check if homeshick castles have been refreshed recently
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(starship init zsh)"
eval "$(mcfly init zsh)"
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
source $(brew --prefix)/opt/homeshick/homeshick.sh
source $(brew --prefix)/share/zsh/site-functions/_todoist_fzf

#######################################################################
#                               Aliases                               #
#######################################################################
alias ls=exa
alias veracrypt="/Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt --text"
alias pass='PASSWORD_STORE_ENABLE_EXTENSIONS=true pass'
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/rollen/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;