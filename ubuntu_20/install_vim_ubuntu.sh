##Instalacion de gvim

sudo apt update -y
sudo apt build-dep vim-gtk3 -y


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

