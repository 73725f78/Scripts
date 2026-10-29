##Instalacion de gvim

sudo dnf update -y
sudo dnf builddep -y vim-X11

#Create desktop application
#sudo desktop-file-install config_files/gvim.desktop

#Set gvim as default for some file types
# xdg-mime query filetype <file> to get the mimetype of <file> 
xdg-mime default gvim.desktop application/x-shellscript
xdg-mime default gvim.desktop text/plain
xdg-mime default gvim.desktop text/x-java
xdg-mime default gvim.desktop application/xml
xdg-mime default gvim.desktop text/x-chdr 
xdg-mime default gvim.desktop text/x-c++src

git clone https://github.com/vim/vim.git
cd vim

./configure --enable-perlinterp=yes     \
	    	--enable-python3interp=yes  \
  	    	--enable-tclinterp=yes      \
  	    	--enable-rubyinterp=yes     \
  	    	--enable-cscope             \
	    	--with-compiledby=L

make 
sudo make install
