mkdir -p ~/.fonts/

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/ComicShannsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Ubuntu.zip

unzip -o -d ~/.fonts/Hack/ Hack.zip 
unzip -o -d ~/.fonts/ComicShannsMono/ ComicShannsMono.zip 
unzip -o -d ~/.fonts/Ubuntu/ Ubuntu.zip ~/.font/

rm *.zip

fc-cache -fv

## Download nerdfonts (select onle the required)
## 	https://www.nerdfonts.com/font-downloads
## 
## Extract to:
## 	~/.fonts/
## 
## run: 
## 	$ fc-cache -fv
## 
## gvim:
## 	select a nerd fonts to show icons (devicons plugin)

## To install all nerdfonts, a lot of time (to download 14G aprox)
##
## git clone https://github.com/ryanoasis/nerd-fonts.git
## cd nerd-fonts
## ./install.sh
