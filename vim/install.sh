#!/usr/bin/env fish
mkdir -p ~/.vim ~/.nvim ~/.config/nvim

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# symlink dotfiles vimrc to .vim/vimrc
ln -isv ~/dotfiles/vim/vimrc ~/.vim/vimrc
ln -isv ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim

# install plugins
nvim -c ':PlugInstall' -c 'qa!'

# IDEAVim
ln -isv ~/dotfiles/vim/ideavimrc ~/.ideavimrc
