set -v

mkdir -p ~/.vim
mkdir -p ~/.vim/pack/my_pack/{opt,start}
mkdir -p ~/.vim/backup/{swap,directory,undodir,spell}

#Copy configuration files
cp _vimrc ~/.vimrc

cp -r my_templates ~/.vim/

cd ~/.vim/pack/my_pack/start

#PlantUML
git clone https://github.com/aklt/plantuml-syntax
git clone https://github.com/tyru/open-browser.vim.git
git clone https://github.com/weirongxu/plantuml-previewer.vim.git

git clone https://github.com/dhruvasagar/vim-table-mode.git
git clone git://github.com/jiangmiao/auto-pairs.git
git clone https://github.com/chrisbra/csv.vim.git
git clone https://github.com/yegappan/mru.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/preservim/tagbar.git
git clone https://github.com/SirVer/ultisnips.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/vhdirk/vim-cmake.git
git clone https://github.com/richq/vim-cmake-completion.git
git clone https://github.com/ryanoasis/vim-devicons.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.git
git clone https://github.com/honza/vim-snippets.git
git clone https://github.com/lervag/vimtex.git
git clone https://github.com/octol/vim-cpp-enhanced-highlight.git
git clone https://github.com/ycm-core/YouCompleteMe.git

cd YouCompleteMe
git submodule update --init --recursive
python3 install.py --java-completer --clangd-completer      # YCM with semantic support for C-family languages (clangd) and java

echo "YCM Works well for gcc-11 g++-11 (For me it is not working for gcc-12 g++-12, if YCM not working remove gcc-11 and g++-11)"

#Para el error, correr los siguientes comandos. Actualizar algunos paquetes del python3
#ycm TypeError: canonicalize_version() got an unexpected keyword argument 'strip_trailing_zero'
#
#python -m pip install --upgrade pip
#python -m pip install --upgrade setuptools wheel twine check-wheel-contents
