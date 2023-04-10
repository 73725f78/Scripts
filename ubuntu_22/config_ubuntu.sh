set -v

wget -O ~/Pictures/linux-circuitry.png https://w.wallha.com/ws/13/RLGoOEqN.png
gsettings set org.gnome.desktop.background picture-uri "file:////$HOME/Pictures/linux-circuitry.png"
gsettings set org.gnome.desktop.background picture-uri-dark "file:////$HOME/Pictures/linux-circuitry.png"

touch ~/Templates/txt_file.txt

cat _bashrc >> ~/.bashrc
cat _profile >> ~/.profile

timedatectl set-timezone America/Mexico_City    #configura zona horario (ntpd)

sudo add-apt-repository universe

sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

sudo snap install cmake --classic
sudo snap install shutter

sudo apt install -y build-essential
sudo apt install -y libssl-dev
sudo apt install -y libncurses-dev 

sudo apt install -y gnome-session
sudo apt install -y gnome-tweaks
sudo apt install -y gnome-shell-extensions
sudo apt install -y $(apt search gnome-shell-extension | grep ^gnome | cut -d / -f1)
sudo apt install -y tor
sudo apt install -y adwaita-icon-theme-full
sudo apt install -y vlc
sudo apt install -y tmux
sudo apt install -y unrar
sudo apt install -y ffmpeg
sudo apt install -y okular
sudo apt install -y gparted
sudo apt install -y minicom
sudo apt install -y imagemagick
sudo apt install -y thunderbird
sudo apt install -y dos2unix
sudo apt install -y openssh-server
sudo apt install -y exuberant-ctags 
sudo apt install -y chromium-browser
sudo apt install -y ffmpegthumbnailer
sudo apt install -y rabbitvcs-nautilus
sudo apt install -y simplescreenrecorder
sudo apt install -y libxml2-utils
sudo apt install -y graphviz
#sudo apt install -y vim-nox

sudo apt install -y gnuplot-x11
sudo apt install -y python3 python3-dev python3-pip
sudo apt install -y ruby ruby-dev
sudo apt install -y tcl tcl-dev
sudo apt install -y clang
sudo apt install -y libclang-dev

sudo apt install -y git
git config --global diff.tool gvimdiff
git config --global merge.tool gvimdiff
git config --global --add difftool.prompt false

#atl-tab shows only apps from the current workspace (checar)
gsettings set org.gnome.shell.app-switcher current-workspace-only false

#Open home folder
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"

#Shows apps from current ws
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"

#Shows apps from all ws
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"   

gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

#Show desktop icons
gnome-extensions enable desktop-icons@csoriano
gnome-extensions enable apps-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable window-list@gnome-shell-extensions.gcampax.github.com

#Java ======================================================================
sudo apt install -y openjdk-17-dbg
sudo apt install -y openjdk-17-demo
sudo apt install -y openjdk-17-doc
sudo apt install -y openjdk-17-jdk
sudo apt install -y openjdk-17-jre

sudo mkdir -p /opt
sudo chown $USER /opt 
sudo chgrp $USER /opt 

#install gradle
wget https://downloads.gradle-dn.com/distributions/gradle-7.5.1-bin.zip
unzip -q gradle-7.5.1-bin.zip
rm gradle-7.5.1-bin.zip
mv gradle-7.5.1 /opt/

#install ant
wget https://dlcdn.apache.org//ant/binaries/apache-ant-1.10.12-bin.tar.gz
tar -xzf apache-ant-1.10.12-bin.tar.gz
rm apache-ant-1.10.12-bin.tar.gz
mv apache-ant-1.10.12 /opt/

#install Ivy
wget https://dlcdn.apache.org//ant/ivy/2.5.1/apache-ivy-2.5.1-bin.tar.gz
tar -xzf apache-ivy-2.5.1-bin.tar.gz
rm apache-ivy-2.5.1-bin.tar.gz
mv apache-ivy-2.5.1 /opt/
mkdir -p /home/luis/.ant/lib
cp /opt/apache-ivy-2.5.1/ivy-2.5.1.jar $HOME/.ant/lib

#install eclipse
wget https://eclipse.mirror.rafal.ca/technology/epp/downloads/release/2023-03/R/eclipse-jee-2023-03-R-linux-gtk-x86_64.tar.gz
tar -xzf eclipse-jee-2023-03-R-linux-gtk-x86_64.tar.gz
rm  eclipse-jee-2023-03-R-linux-gtk-x86_64.tar.gz
mv  eclipse /opt/

sudo desktop-file-install eclipse.desktop
