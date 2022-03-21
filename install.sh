pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

pushd ~
mkdir -p src
pushd src

if [ -e config ] ; then
    read -p "WARNING: ~/src/config directory exists. Delete/Skip/Cancel? (d/s/c)" confirm
    [[ $confirm == [cC] ]] && exit 1
    [[ $confirm == [dD] ]] && rm -rf config
    [[ $confirm == [sS] ]] || exit 1
fi

 [[ $confirm == [sS] ]] || git clone https://github.com/SebRollen/config.git

pushd config

# Install homebrew
if ! command -v brew &> /dev/null
then
    echo "Installing brew. Requires password, you will be prompted"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing brew packages"
brew bundle

echo "Installing vim plugin manager"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Installing vim plugins"
vim -c PlugInstall -c q -c q

echo "Create vim swapfile directory"
mkdir -p "$HOME/.vim/swapfiles"

delete_and_relink() {
    local file="$1"
    local prefix="${2:-}"
    rm -rf "$HOME/.$prefix$file" > /dev/null 2>&1
    ln -fs "$HOME/src/config/$prefix$file" "$HOME/.$prefix$file"
}

delete_and_relink "vimrc"
delete_and_relink "gitconfig"
delete_and_relink "tmux.conf"
delete_and_relink "mutt"
delete_and_relink "zshenv"
delete_and_relink "zshrc"
pushd gnupg
delete_and_relink "gpg.rc" "gnupg/"
delete_and_relink "gpg.conf" "gnupg/"
delete_and_relink "gpg-agent.conf" "gnupg/"
popd # ~/src/config/gnupg
pushd ssh
delete_and_relink "config" "ssh/"
delete_and_relink "id_rsa_yubikey.pub" "ssh/"
popd # ~/src/config/ssh

open theme.terminal
osascript -e "tell application \"Terminal\" to set current settings of first window to settings set \"theme\""

# ~/src/config
popd
# ~/src
popd
# ~
popd
