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
sudo apt install -y shutter
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
sudo apt install -y graphviz-dev
sudo apt install -y gimp
sudo apt install -y plantuml
sudo apt install -y xournalpp
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

#enable a gnome-shell extension ubuntu
gnome-extensions enable ding@rastersoft.com 
gnome-extensions enable window-list@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable ubuntu-appindicators@ubuntu.com
gnome-extensions enable apps-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable places-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable windowsNavigator@gnome-shell-extensions.gcampax.github.com

#atl-tab shows only apps from the current workspace (checar)
gsettings set org.gnome.shell.app-switcher current-workspace-only false

#Open home folder
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"

#Shows apps from current ws
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"

#Shows apps from all ws
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"   

gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

#Java ======================================================================
sudo apt install -y openjdk-21-dbg
sudo apt install -y openjdk-21-demo
sudo apt install -y openjdk-21-doc
sudo apt install -y openjdk-21-jdk
sudo apt install -y openjdk-21-jre

pip install conan

sudo mkdir -p /opt
sudo chown $USER /opt 
sudo chgrp $USER /opt 


function download_install(){
	url=$1
	file_name=$2
	pack_dir=$3
	format="${4:-tar.gz}"

	echo $format

	wget -4 $url$file_name

	case $format in
		"tar.gz")  tar -xzf $file_name ;;
		"tar.bz2") tar -xjf $file_name ;;
		"zip")     unzip -q $file_name ;;
	esac;
	
	rm $file_name
	mv $pack_dir /opt/
}

download_install "https://download.zotero.org/client/release/6.0.35/" "Zotero-6.0.35_linux-x86_64.tar.bz2" "Zotero_linux-x86_64" "tar.bz2"
download_install "https://downloads.gradle.org/distributions/" "gradle-8.3-bin.zip" "gradle-8.3" "zip"
download_install "https://archive.apache.org/dist/ant/binaries/" "apache-ant-1.10.15-bin.tar.gz" "apache-ant-1.10.14" 
download_install "https://archive.apache.org/dist/ant/ivy/2.5.2/" "apache-ivy-2.5.2-bin.tar.gz" "apache-ivy-2.5.2"
download_install "https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.31/bin/" "apache-tomcat-10.1.31.tar.gz" "apache-tomcat-10.1.31" "tar.gz"
download_install "https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2024-06/R/" "eclipse-jee-2024-06-R-linux-gtk-x86_64.tar.gz" "eclipse"

mkdir -p /home/$USER/.ant/lib
cp /opt/apache-ivy-2.5.2/ivy-2.5.2.jar $HOME/.ant/lib

sudo desktop-file-install eclipse.desktop
