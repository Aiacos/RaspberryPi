## Update
cd $home
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

# Dev Tools
sudo apt install net-tools -y
sudo apt install python3 python3-pip pipx python3-setuptools git -y

## Pironman5
cd ~
git clone https://github.com/sunfounder/pironman5.git
cd ~/pironman5
sudo python3 install.py
cd ~

## Argon One Util
#curl https://download.argon40.com/argon1.sh | bash

# Configure SSH
sudo apt install openssh-server sshguard -y

# Install Apps
sudo apt install neofetch -y
sudo apt install btop -y
sudo apt install gedit -y
sudo apt install geany -y
sudo apt install cmatrix -y
sudo apt install tmux -y
sudo apt install ranger -y
sudo apt install sxiv -y
sudo apt install chafa -y
sudo apt install neovim -y
sudo apt install ncdu -y

touch ~/.config/ranger/rc.conf
echo "set preview_images true" >> ~/.config/ranger/rc.conf
echo "set preview_images_method w3m" >> ~/.config/ranger/rc.conf

## Install Zellij from Cargo
# Cargo
curl https://sh.rustup.rs -sSf | sh

# Zellij
cargo install --locked zellij

# Speedtest
sudo apt-get install curl
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt-get install speedtest

# CasaOS
curl -fsSL https://get.casaos.io | sudo bash
sudo groupadd docker
sudo usermod -aG docker $USER

## Brew
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/aiacos/.zshrc
#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#echo 'export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"' >> ~/.zshrc

#brew install zellij
#brew install jesseduffield/lazygit/lazygit
#brew install jesseduffield/lazydocker/lazydocker
#brew install zsh-history-substring-search
#brew install atuin
#brew install dust

## Neovim setup
sudo snap install --classic nvim 
echo 'alias nvim="/snap/bin/nvim"' >> ~/.zshrc
source ~/.zshrc

# Dependencies
sudo apt install npm nodejs cargo ripgrep fd-find clang clangd -y  
sudo apt install pipx python3-full python3-pynvim python3-ply -y  
cargo install tree-sitter-cli
brew install bottom

# Go disk usage
curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz
sudo chmod +x gdu_linux_amd64
sudo mv gdu_linux_amd64 /usr/bin/gdu

# Nerd Fonts
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash  

# LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim --headless +q

# Dracula theme
sudo apt-get install dconf-cli -y
cd
mkdir .settings
cd .settings

# Dracula Gnome Terminal
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh

# Dracula Wallpaper
cd ..
git clone https://github.com/dracula/wallpaper.git

## Configure ZSH with Prezto
# Configure ZSH
sudo apt install git wget curl ruby zsh -y
chsh -s $(which zsh)
curl -fsSL https://raw.githubusercontent.com/Aiacos/presto-prezto/main/presto-prezto.sh | bash -s -- --font

tee -a ~/.zellij_base_layout.kdl << EOF
layout {
        default_tab_template {
                pane size=1 borderless=true {
                plugin location="zellij:tab-bar"
        }
        children
        pane size=2 borderless=true {
                plugin location="zellij:status-bar"
        }
    }   
        tab name="Work" split_direction="Vertical" {
        pane split_direction="Vertical" {
            pane name="Btop" command="btop" {

            }
            pane split_direction="Horizontal" {
                pane name="System" command="neofetch" {

                }
                pane focus=true name="Shell" {

                }
            }
        }
    }
}
session_name "Base"
attach_to_session true

EOF
