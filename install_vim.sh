yum install man-pages man-db man				#Instala man pages
timedatectl set-timezone America/Mexico_City    #configura zona horario (ntpd)

##Instalacion de gvim

git clone https://github.com/vim/vim.git
yum-builddep -y vim-X11
yum install  -y python3 python3-devel
yum install  -y ruby
yum install  -y perl
yum install  -y tcl tcl-devel
yum install  -y cmake
yum install  -y cmake3
yum install  -y go
yum install  -y npm
yum install  -y dos2unix

cd vim

./configure --enable-perlinterp=yes     \
	    	--enable-python3interp=yes  \
  	    	--enable-tclinterp=yes      \
  	    	--enable-rubyinterp=yes     \
  	    	--enable-cscope             \
	    	--with-compiledby=L
 
make 
make install
