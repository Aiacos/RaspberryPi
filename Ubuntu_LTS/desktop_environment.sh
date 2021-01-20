## Install Snap
sudo apt install snapd -y
sudo apt install plank -y

## Install Theme
sudo snap install mojave-themes

sudo snap connect [other snap]:gtk-3-themes mojave-themes:gtk-3-themes
sudo snap connect [other snap]:icon-themes mojave-themes:icon-themes
for i in $(snap connections | grep gtk-common-themes:gtk-3-themes | awk '{print $2}'); do sudo snap connect $i mojave-themes:gtk-3-themes; done
for i in $(snap connections | grep gtk-common-themes:icon-themes | awk '{print $2}'); do sudo snap connect $i mojave-themes:icon-themes; done


#sudo apt install ubuntu-budgie-desktop -y
#sudo snap install ubuntu-budgie-welcome --classic
#sudo apt install lubuntu-desktop -y
