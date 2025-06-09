export EDITOR=vim
eval "$(/opt/homebrew/bin/brew shellenv)"
export GPG_TTY="$(TTY)"
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
export MCFLY_KEY_SCHEME=vim
export MCFLY_FUZZY=2
export MCFLY_PROMPT="❯"
. "$HOME/.cargo/env"
export TERM="alacritty"

# Nord theme for nnn
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export HOMESHICK_DIR=/opt/homebrew/opt/homeshick
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/lipq/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
