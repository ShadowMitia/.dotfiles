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

#Emacs oh-my-zsh install
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Emacs powerlevel10k install
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# You might need to reset .zshrc for changes to be made
# Set ZSH_THEME="powerlevel10k/powerlevel10k" in .zshrc if not done


echo ""
echo "##### ALL DONE"
