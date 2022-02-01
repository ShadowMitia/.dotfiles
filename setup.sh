#!/usr/bin/env bash
# From : https://writingco.de/blog/how-i-manage-my-dotfiles-using-gnu-stow/

user=$(whoami)

# what directories should be installable by all users including the root user
base=(
    bash
)

# folders that should, or only need to be installed for a local user
useronly=(
    git
    emacs
    cargo
    config
    zsh
)

# run the stow command for the passed in directory ($2) in location $1
stowit() {
    path=$1
    app=$2
    echo "$app"
    # -v verbose
    # -R recursive
    # -t target
    stow -d ~/.dotfiles -v -t "$path" -R "${app}"
}

echo ""
echo "Stowing apps for user: $user" 


# install apps available to local users and root
for app in "${base[@]}"; do
    stowit "${HOME}" "$app"
done

# install only user space folders
for app in "${useronly[@]}"; do
    if ! [ "$user" = "root" ]; then
        stowit "$HOME" "$app"
    fi
done

echo ""
echo "##### ALL DONE"
