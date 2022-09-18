##Instalacion de gvim

set -v

sudo apt update -y
sudo apt build-dep vim-gtk3 -y

#Copy configuration files
cp _vimrc ~/.vimrc
sudo desktop-file-install gvim.desktop

#Set gvim as default for some file types
# xdg-mime query filetype <file> to get the mimetype of <file> 
xdg-mime default gvim.desktop application/x-shellscript
xdg-mime default gvim.desktop text/plain
xdg-mime default gvim.desktop text/x-java
xdg-mime default gvim.desktop application/xml
xdg-mime default gvim.desktop text/x-chdr 

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

