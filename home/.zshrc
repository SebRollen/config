# Enable zsh completion
autoload -Uz compinit && compinit -u
#gpgconf --launch gpg-agent

homeshick --quiet refresh # Check if homeshick castles have been refreshed recently
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which starship > /dev/null; then eval "$(starship init zsh)"; fi
if which mcfly > /dev/null; then eval "$(mcfly init zsh)"; fi
if which op > /dev/null; then eval "$(op completion zsh)"; compdef _op op; fi
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
source $(brew --prefix)/opt/homeshick/homeshick.sh
source $(brew --prefix)/share/zsh/site-functions/_todoist_fzf

#######################################################################
#                               Aliases                               #
#######################################################################
alias vim=nvim
alias ls=eza
alias veracrypt="/Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt --text"
alias pass='PASSWORD_STORE_ENABLE_EXTENSIONS=true pass'
alias vim=nvim
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/rollen/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
export LANG="en_US.UTF-8"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval $(thefuck --alias)

# https://github.com/rails/rails/issues/38560
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export DISABLE_SPRING=true

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$(brew --prefix)/opt/postgresql@15/bin:$PATH"
export PATH="/Users/rollen/bin:$PATH"

. "$HOME/.local/bin/env"
