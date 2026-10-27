#!/bin/bash

set -v

sudo hostnamectl set-hostname myrhel

# 1. Configuración de Zona Horaria
sudo timedatectl set-timezone America/Mexico_City

# 2. Plantillas de Usuario
mkdir -p ~/Templates
touch ~/Templates/txt_file.txt

# 3. Archivos de Configuración de Shell
if [ -d "config_files" ]; then
	mkdir -p ~/.bashrc.d
    [ -f "config_files/_bashrc" ] && cp config_files/_bashrc ~/.bashrc.d/

    if [ -f "config_files/_bash_profile" ]; then
        # Buscamos una frase clave exclusiva de tu archivo para ver si ya existe en el destino
        if ! grep -q "My configurations" ~/.bash_profile; then
            echo "" >> ~/.bash_profile # Añade un salto de línea de separación
            cat config_files/_bash_profile >> ~/.bash_profile
            echo "-> Contenido de _bash_profile añadido correctamente."
        else
            echo "-> El contenido de _bash_profile ya estaba aplicado. Omitiendo..."
        fi
    fi
    
    #mkdir -p ~/Pictures
    #[ -f "config_files/pictures/circuitry-bsd-logo.jpg" ] && cp config_files/pictures/circuitry-bsd-logo.jpg ~/Pictures/
fi

exit 0

# 4. Configuración de GNOME Desktop (RHEL 10 / Wayland)
BACKGROUND_PATH="$HOME/Pictures/circuitry-bsd-logo.jpg"

if [ -f "$BACKGROUND_PATH" ]; then
    gsettings set org.gnome.desktop.background picture-uri "file://${BACKGROUND_PATH}"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://${BACKGROUND_PATH}"
fi

# Color primario y comportamiento de ventanas
gsettings set org.gnome.desktop.background primary-color '#000000'
gsettings set org.gnome.shell.app-switcher current-workspace-only false
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'nothing'

# Atajos de Teclado
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"

# 5. Activación de Extensiones de GNOME (Instaladas previamente en tus RPMs)
gnome-extensions enable window-list@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable apps-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable places-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable windowsNavigator@gnome-shell-extensions.gcampax.github.com

# ====================================================================== opt

### function download_install(){
### 	url=$1
### 	file_name=$2
### 	pack_dir=$3
### 	format="${4:-tar.gz}"
### 
### 	echo $format
### 
### 	wget -4 $url$file_name
### 
### 	case $format in
### 		"tar.gz")  tar -xzf $file_name ;;
### 		"tar.bz2") tar -xjf $file_name ;;
### 		"zip")     unzip -q $file_name ;;
### 	esac;
### 	
### 	rm $file_name
### 	mv $pack_dir /opt/
### }
### 
### download_install "https://archive.apache.org/dist/ant/ivy/2.5.2/" "apache-ivy-2.5.2-bin.tar.gz" "apache-ivy-2.5.2"
### download_install "https://archive.apache.org/dist/tomcat/tomcat-11/v11.0.1/bin/" "apache-tomcat-11.0.1.tar.gz" "apache-tomcat-11.0.1" "tar.gz"
### download_install "https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2024-12/R/" "eclipse-jee-2024-12-R-linux-gtk-x86_64.tar.gz" "eclipse"
### download_install "https://downloads.gradle.org/distributions/" "gradle-8.3-bin.zip" "gradle-8.3" "zip"
### 
### mkdir -p /home/$USER/.ant/lib
### cp /opt/apache-ivy-2.5.2/ivy-2.5.2.jar $HOME/.ant/lib
### 
### sudo desktop-file-install config_files/eclipse.desktop
