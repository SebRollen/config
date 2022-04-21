eval "$(/opt/homebrew/bin/brew shellenv)"
export GPG_TTY="$(TTY)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export MCFLY_KEY_SCHEME=vim
. "$HOME/.cargo/env"
