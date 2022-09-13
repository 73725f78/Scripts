set -v

wget https://www.freebsdnews.com/wp-content/uploads/linux-circuitry-taringa-5865330.jpg.png
mv linux-circuitry-taringa-5865330.jpg.png ~/Pictures/linux-circuitry.png

gsettings set org.gnome.desktop.background picture-uri "file:////$HOME/Pictures/linux-circuitry.png"

touch ~/Templates/file.txt

cat _bashrc >> ~/.bashrc
cat _profile >> ~/.profile

timedatectl set-timezone America/Mexico_City    #configura zona horario (ntpd)

sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

#sudo snap install vim-editor                    # 8.2.788
sudo snap install cmake --classic
sudo snap install gradle --classic
sudo snap install shutter

sudo apt install -y libncurses-dev 
sudo apt install -y gnome-session
sudo apt install -y gnome-tweaks gnome-tweak-tool
sudo apt install -y gnome-shell-extensions
sudo apt install -y adwaita-icon-theme-full
