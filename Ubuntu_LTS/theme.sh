## Install
sudo apt update -y
sudo apt install xterm -y

## Install Theme
git clone https://github.com/debugster/GnomeTweaks.git
cd GnomeTweaks
chmod +x macUbuntu.sh
./macUbuntu.sh

## CleanUp
cd
sudo rm -r -f GnomeTweaks
