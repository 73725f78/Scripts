set -v

mkdir -p ~/.vim
mkdir -p ~/.vim/pack/my_pack/{opt,start}
mkdir -p ~/.vim/backup/{swap,directory,undodir,spell}

cp -r my_templates ~/.vim/

cd ~/.vim/pack/my_pack/start

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

#Optionals
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh

cd ..
git clone https://github.com/ycm-core/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive

python3 install.py --java-completer --clangd-completer      # YCM with semantic support for C-family languages (clangd) and java
