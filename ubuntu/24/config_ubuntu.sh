set -v

touch ~/Templates/txt_file.txt

cat config_files/_bashrc >> ~/.bashrc
cat config_files/_profile >> ~/.profile

cp config_files/pictures/circuitry-bsd-logo.jpg  ~/Pictures/
gsettings set org.gnome.desktop.background picture-uri "file:////$HOME/Pictures/circuitry-bsd-logo.jpg"
gsettings set org.gnome.desktop.background picture-uri-dark "file:////$HOME/Pictures/circuitry-bsd-logo.jpg"
gsettings set org.gnome.shell.app-switcher current-workspace-only false		
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"		  
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"		  
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"   
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

git config --global diff.tool gvimdiff
git config --global merge.tool gvimdiff
git config --global --add difftool.prompt false

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

sudo config_files/desktop-file-install eclipse.desktop
