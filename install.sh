delete_and_relink() {
    local file="$1"
    printf "\\nDeleting file $file\\n"
    rm -rf "~/.$file" > /dev/null 2>&1
    printf "\\nLinking file $file\\n"
    ln -sf "~/src/dotfiles/$file" "~/.$file"
}

delete_and_relink "vimrc"
delete_and_relink "gitconfig"
delete_and_relink "tmux.conf"
delete_and_relink "mutt"

brew bundle
