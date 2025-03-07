set -v

cat _bashrc >> ~/.bashrc
cat _profile >> ~/.profile

touch ~/Templates/txt_file.txt

cp pictures/circuitry-bsd-logo.jpg  ~/Pictures/
gsettings set org.gnome.desktop.background picture-uri "file:////$HOME/Pictures/circuitry-bsd-logo.jpg"
gsettings set org.gnome.desktop.background picture-uri-dark "file:////$HOME/Pictures/circuitry-bsd-logo.jpg"

sudo add-apt-repository universe

sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

git config --global diff.tool gvimdiff
git config --global merge.tool gvimdiff
git config --global --add difftool.prompt false

#atl-tab shows only apps from the current workspace (checar)
gsettings set org.gnome.shell.app-switcher current-workspace-only false		
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"		  #Open home folder
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"		  #Shows apps from current ws
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"   #Shows apps from all ws
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

sudo apt install -y $(apt search gnome-shell-extension | grep ^gnome | cut -d / -f1)
pip install conan

#enable a gnome-shell extension ubuntu
gnome-extensions enable ding@rastersoft.com 
gnome-extensions enable window-list@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable ubuntu-appindicators@ubuntu.com
gnome-extensions enable apps-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable places-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable windowsNavigator@gnome-shell-extensions.gcampax.github.com

# ====================================================================== opt

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

download_install "https://archive.apache.org/dist/ant/ivy/2.5.2/" "apache-ivy-2.5.2-bin.tar.gz" "apache-ivy-2.5.2"
download_install "https://archive.apache.org/dist/tomcat/tomcat-11/v11.0.1/bin/" "apache-tomcat-11.0.1.tar.gz" "apache-tomcat-11.0.1" "tar.gz"
download_install "https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2024-12/R/" "eclipse-jee-2024-12-R-linux-gtk-x86_64.tar.gz" "eclipse"
download_install "https://downloads.gradle.org/distributions/" "gradle-8.3-bin.zip" "gradle-8.3" "zip"

mkdir -p /home/$USER/.ant/lib
cp /opt/apache-ivy-2.5.2/ivy-2.5.2.jar $HOME/.ant/lib

sudo desktop-file-install eclipse.desktop
