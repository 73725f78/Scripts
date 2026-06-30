#list available repos
#sudo subscription-manager repos --list

# I installed it manually
#libreoffice

#dnf update redhat-release

#VLC no funciono con dnf, se instalo con flatpak
#En teroria deberia haber funcionado con los codecs
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.videolan.VLC
#Screen recorder (Wayland gnome RHEL10)
flatpak install flathub com.obsproject.Studio

sudo subscription-manager repos --enable "rhel-10-for-$(arch)-extensions-rpms"
sudo subscription-manager repos --enable "codeready-builder-for-rhel-10-$(uname -m)-rpms"
sudo subscription-manager repos --enable codeready-builder-for-rhel-10-$(arch)-rpms

sudo dnf install -y epel-release
sudo dnf install -y rpmfusion-free-release

sudo dnf group install -y "Development Tools"
sudo dnf install -y gmp
sudo dnf install -y gmp-c++
sudo dnf install -y gmp-devel

#sudo dnf install -y vlc-plugins-freeworld ffmpeg-libs
#sudo dnf install -y ffmpeg
#sudo dnf install -y ffmpeg-free
#sudo dnf install -y ffmpeg-free-devel

#For Georgia font in Latex.
sudo dnf install curl cabextract xorg-x11-font-utils fontconfig
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm


sudo dnf install -y libxcrypt-compat	  			#For Biber latex (require this to work in RHEL, compatibility)
sudo dnf install -y ffmpegthumbnailer
#sudo dnf install -y gnome-shell-extensions
sudo dnf install -y perl-core
sudo dnf install -y perl-Unicode-Normalize		#nedded for texlive
sudo dnf install -y gnome-shell-extension*
sudo dnf install -y vlc
sudo dnf install -y git
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
sudo dnf install -y ffmpegthumbnailer
sudo dnf install -y graphviz
sudo dnf install -y xournalpp
sudo dnf install -y python3
sudo dnf install -y python3-pip
sudo dnf install -y ruby 
sudo dnf install -y tcl 
sudo dnf install -y clang
sudo dnf install -y cmake
sudo dnf install -y thunderbird
sudo dnf install -y chromium
sudo dnf install -y vim-X11
sudo dnf install -y java-21-openjdk
sudo dnf install -y java-21-openjdk-demo
sudo dnf install -y java-21-openjdk-devel
sudo dnf install -y java-21-openjdk-javadoc
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

#para instalar opera
# sudo rpm --import https://rpm.opera.com/rpmrepo.key
# sudo vim /etc/yum.repos.d/opera.repo 
##   [opera]
##   name=Opera packages
##   type=rpm-md
##   baseurl=https://rpm.opera.com/rpm
##   gpgcheck=1
##   gpgkey=https://rpm.opera.com/rpmrepo.key
##   enabled=1
#
# sudo dnf install opera-stable

#No funcionan, revisar.
#sudo dnf install -y gimp
#sudo dnf install -y gparted
#sudo dnf install -y gnuplot-x11
#sudo dnf install -y build-essential
#sudo dnf install -y rabbitvcs-nautilus
#sudo dnf install -y simplescreenrecorder
#sudo dnf install -y zotero
#sudo dnf install -y libclang-dev

