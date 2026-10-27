#list available repos
#sudo subscription-manager repos --list
#
### sudo dnf install -y flatpak
### sudo flatpak remote-delete flathub
### flatpak repair --user
### sudo flatpak repair --system
### sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.opera.Opera -y
flatpak install flathub org.chromium.Chromium -y
flatpak install flathub com.github.xournalpp.xournalpp -y
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub org.zotero.Zotero -y
flatpak install flathub org.libreoffice.LibreOffice -y
#flatpak install flathub org.videolan.VLC

# 1. Enable the CodeReady Builder repository for RHEL 10
sudo subscription-manager repos --enable codeready-builder-for-rhel-10-x86_64-rpms
# 2. Install the EPEL 10 release package directly from Fedora EPEL
sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
# Install RPM Fusion Free and Non-Free repositories for EL10
sudo dnf install -y \
  https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-10.noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-10.noarch.rpm

sudo dnf install -y epel-release
sudo dnf install -y rpmfusion-free-release

sudo dnf install -y git
git config --global diff.tool gvimdiff
git config --global merge.tool gvimdiff
git config --global --add difftool.prompt false

sudo dnf groupinstall -y "Development Tools"
sudo dnf install -y ffmpeg
sudo dnf install -y gnuplot
sudo dnf install -y clang-devel
sudo dnf install -y libxcrypt-compat	  			#For Biber latex (require this to work in RHEL, compatibility)
sudo dnf install -y ffmpegthumbnailer
sudo dnf install -y perl-core
sudo dnf install -y perl-Unicode-Normalize		#nedded for texlive
sudo dnf install -y gnome-shell-extension*
sudo dnf install -y vlc
sudo dnf install -y tor
sudo dnf install -y tmux
sudo dnf install -y unrar
sudo dnf install -y okular
sudo dnf install -y plantuml
sudo dnf install -y minicom
sudo dnf install -y dos2unix
sudo dnf install -y gnome-tweaks
sudo dnf install -y gnome-session
sudo dnf install -y adwaita-icon-theme
sudo dnf install -y thunderbird
sudo dnf install -y openssh-server
sudo dnf install -y graphviz
sudo dnf install -y python3
sudo dnf install -y python3-pip
sudo dnf install -y ruby 
sudo dnf install -y tcl 
sudo dnf install -y clang
sudo dnf install -y cmake
sudo dnf install -y thunderbird
sudo dnf install -y vim-X11
sudo dnf install -y java-25-openjdk
sudo dnf install -y java-25-openjdk-demo
sudo dnf install -y java-25-openjdk-devel
sudo dnf install -y java-25-openjdk-javadoc
sudo dnf install -y python3-devel
sudo dnf install -y ruby-devel
sudo dnf install -y tcl-devel
sudo dnf install -y mysql8.4-devel
sudo dnf install -y mysql8.4-errmsg
sudo dnf install -y mysql8.4-libs
sudo dnf install -y mysql8.4-server
sudo dnf install -y mysql8.4-test
sudo dnf install -y mysql8.4-test-data
sudo dnf install -y ImageMagick
sudo dnf install -y ImageMagick-devel
sudo dnf install -y ctags 
sudo dnf install -y ntfs-3g ntfs-3g-devel fuse
sudo dnf install -y vlc-plugin-ffmpeg vlc-plugin-gstreamer
sudo dnf install -y okular

#Required for rabbitcsv
sudo dnf install -y nautilus-python
sudo dnf install -y python-pygments
sudo dnf install -y python3-tkinter
sudo dnf install -y python3-dulwich
sudo dnf install -y python3-gobject
sudo dnf install -y python-configobj

sudo dnf install -y curl cabextract xorg-x11-font-utils fontconfig #for latex

sudo dnf install -y gmp
sudo dnf install -y gmp-c++
sudo dnf install -y gmp-devel

### #For Georgia font in Latex.
### #sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

GRADLE_VERSION="9.8.2"
GRADLE_DIR="/opt/gradle/gradle-${GRADLE_VERSION}"

if [ -d "$GRADLE_DIR" ]; then
    echo "-> Gradle $GRADLE_VERSION ya está instalado en $GRADLE_DIR. Omitiendo instalación."
else
    echo "Instalando Gradle $GRADLE_VERSION..."

    wget -q "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -P /tmp

    # 2. Crear directorio raíz y descomprimir
    sudo mkdir -p /opt/gradle
    sudo unzip -q -o "/tmp/gradle-${GRADLE_VERSION}-bin.zip" -d /opt/gradle

    # 3. Limpiar el archivo temporal descargado
    rm "/tmp/gradle-${GRADLE_VERSION}-bin.zip"
fi

# Asegurar que el enlace simbólico siempre apunte a la versión deseada
sudo ln -sfn "$GRADLE_DIR" /opt/gradle/latest
echo "-> Gradle configurado exitosamente en /opt/gradle/latest"
