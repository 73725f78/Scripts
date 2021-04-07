##Instalacion de gvim

sudo apt update -y
sudo apt build-dep vim-gtk3 -y
sudo apt install  -y python3 python3-dev
sudo apt install  -y ruby ruby-dev
sudo apt install  -y tcl tcl-devel
sudo apt install  -y cmake
sudo apt install  -y dos2unix

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
