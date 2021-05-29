
#!/bin/bash

# TODO: allow this to be run non interactively
# TODO: split this up into groups to make some optional
# TODO: think about best way of making this more cross-platform

# TODO: manage git based stuff
# https://gitlab.com/jallbrit/cbonsai

if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi

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


sudo -u $real_user pip3 install --user youtube_dl pygments
sudo -u $real_user flatpak install flathub com.spotify.Client \
                                           com.discordapp.Discord \
                                           com.mojang.Minecraft \
                                           com.obsproject.Studio \
                                           com.visualstudio.code \
                                           com.leinardi.gwe \
                                           com.skype.Client \
                                           com.slack.Slack

# Install cargo and Rust
sudo -u $real_user curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sudo -u $real_user sh
sudo -u $real_user echo "export PATH=\"$HOME/.cargo/bin:$PATH\"" >> $HOME/.bashrc_profile

sudo -u $real_user source $HOME/.bashrc

sudo -u $real_user cargo install topgrade hexyl sccache bindgen cargo-watch cargo-edit cargo-audit