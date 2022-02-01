
#!/bin/bash

# TODO: allow this to be run non interactively
# TODO: split this up into groups to make some optional
# TODO: think about best way of making this more cross-platform

# TODO: manage git based stuff
# https://gitlab.com/jallbrit/cbonsai

if ! [ "$(id -u)" = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

if [ "$SUDO_USER" ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi

# Update mirrors to get closer sources
sudo -u "$real_user"sed -i 's|http://us.|http://fr.|g'/etc/apt/sources.list.d/system.sources


# Add repo for yarn
# sudo -u $real_user curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# sudo -u $real_user echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list



# Update the system before we install anything
apt update

apt install apt-transport-https \
	        vlc \
            gnome-tweaks \
            thefuck \
            ffmpeg \
            cmake \
            valgrind \
            wget \
            neofetch \
            feh \
            python3 \
            python3-pip \
            gnome-sushi \
            notepadqq \
            steam \
            tilix \
            emacs \
            git \
            curl \
            renderdoc \
            flatpak \
            blender \
            zsh \
            yarn \
            xr-hardware \
            stow \
            htop \
            clang \
            nvtop \
            fzf \
            shellcheck \
            linux-tools-common linux-tools-generic linux-tools-`uname -r` \
            kcachegrind perf \
            zola \
            gamemode \
            transmission-gtk \
            fzf gnuplot \
            build-essential \
            aria2 \ # For yt-dlp


sudo -u "$real_user" pip3 install --user yt-dlp pygments
sudo -u "$real_user" flatpak install flathub com.spotify.Client \
                                           com.discordapp.Discord \
                                           com.mojang.Minecraft \
                                           com.obsproject.Studio \
                                           com.visualstudio.code \
                                           com.leinardi.gwe

# Install cargo and Rust
sudo -u "$real_user" curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sudo -u "$real_user" sh
echo "export PATH=\"$HOME/.cargo/bin:$PATH\"" | sudo -u "$real_user" tee "$HOME/.bashrc_profile"

sudo -u "$real_user" sh -c source "$HOME/.bashrc"

sudo -u "$real_user" cargo install topgrade cargo-update hexyl sccache bindgen cargo-watch cargo-edit cargo-audit steam_randomiser


# Add gits and bin directories
mkdir -p ~/gits ~/bin

# Clone git repos

# Note: requires ssh access for some of themsudo apt install libdvdnav4 libdvd-pkg gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libdvd-pkg TODO: sort this out and maybe see if can be made non interactive
# NOTE: for thumbnail mp4/mkv support and reading dvds
# sudo apt install libdvdnav4 libdvd-pkg gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libdvd-pkg

# sudo apt install ubuntu-restricted-extras

# sudo dpkg-reconfigure libdvd-pkg
