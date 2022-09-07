#!/usr/bin/env bash
# From : https://writingco.de/blog/how-i-manage-my-dotfiles-using-gnu-stow/

user=$(whoami)

# what directories should be installable by all users including the root user
base=(
    bash
)

# folders that should, or only need to be installed for a local user
useronly=(
    home
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
echo "$app"
    stowit "$HOME" "$app"
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

exit 0

# You might need to reset .zshrc for changes to be made
# Set ZSH_THEME="powerlevel10k/powerlevel10k" in .zshrc if not done

# Oh my posh install theme install
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip

echo ""
echo "##### ALL DONE"
if [ -f "/usr/local/bin/oh-my-posh" ]; then
    echo "Install oh-my-posh with"
    echo "sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh"
    echo "sudo chmod +x /usr/local/bin/oh-my-posh"
fi


# To install bash insulter
# wget -O ~/bin/bash.command-not-found https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/bash.command-not-found
