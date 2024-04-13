## Update
cd $home
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y


## Argon One Util
#curl https://download.argon40.com/argon1.sh | bash

# Dev Tools
sudo apt install net-tools -y
sudo apt install python3 python3-pip pipx -y

# Configure SSH
sudo apt install openssh-server sshguard -y

# Install Apps
sudo apt install neofetch -y
sudo apt install btop -y
sudo apt install gedit -y
sudo apt install geany -y
sudo apt install cmatrix -y
sudo apt install tmux -y
sudo apt install gnome-tweaks -y


# CasaOS
curl -fsSL https://get.casaos.io | sudo bash
sudo groupadd docker
sudo usermod -aG docker $USER

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/aiacos/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install jesseduffield/lazygit/lazygit
brew install jesseduffield/lazydocker/lazydocker


# Dracula theme
sudo apt-get install dconf-cli -y
cd
mkdir .settings
cd .settings
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh
cd ..
git clone https://github.com/dracula/wallpaper.git
cd 

# Install Tweak
pipx install gnome-extensions-cli --system-site-packages
cd $HOME/.local/pipx/venvs/gnome-extensions-cli/bin

./gnome-extensions-cli install extensions@abteil.org
./gnome-extensions-cli install services-systemd@abteil.org
#./gnome-extensions-cli install arcmenu@arcmenu.com
#./gnome-extensions-cli install rocketbar@chepkun.github.com
./gnome-extensions-cli install tiling-assistant@leleat-on-github
./gnome-extensions-cli install trayIconsReloaded@selfmade.pl
./gnome-extensions-cli install workspace-indicator@gnome-shell-extensions.gcampax.github.com
#./gnome-extensions-cli install tophat@fflewddur.github.io
./gnome-extensions-cli install blur-my-shell@aunetx

cd

#gsettings set org.gnome.desktop.interface color-scheme prefer-dark
#gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
#gsettings set org.gnome.desktop.interface icon-theme 'Numix-Square'
#gsettings set org.gnome.desktop.interface icon-theme 'Yaru-blue'

# Configure ZSH
sudo apt install git wget curl ruby zsh -y
chsh -s $(which zsh)
curl -fsSL https://raw.githubusercontent.com/JGroxz/presto-prezto/main/presto-prezto.sh | bash -s -- --font
p10k configure
