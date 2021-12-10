set -v

cp _bashrc ~/.bashrc
cp _profile ~/.profile

timedatectl set-timezone America/Mexico_City    #configura zona horario (ntpd)

sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

#sudo snap install vim-editor                    # 8.2.788
sudo snap install cmake --classic

sudo apt install -y gparted
sudo apt install -y vlc
sudo apt install -y okular
sudo apt install -y simplescreenrecorder
sudo apt install -y thunderbird
sudo apt install -y git
sudo apt install -y tmux
sudo apt install -y gnome-session
sudo apt install -y gnome-tweaks gnome-tweak-tool
sudo apt install -y gnome-shell-extensions
sudo apt install -y adwaita-icon-theme-full
sudo apt install -y ffmpegthumbnailer
sudo apt install -y unrar
sudo apt install -y openssh-server

sudo apt install -y openjdk-8-dbg
sudo apt install -y openjdk-8-demo
sudo apt install -y openjdk-8-doc
sudo apt install -y openjdk-8-jdk
sudo apt install -y openjdk-8-jre

sudo apt install -y python3 python3-dev
sudo apt install -y ruby ruby-dev
sudo apt install -y tcl tcl-devel
sudo apt install -y dos2unix

