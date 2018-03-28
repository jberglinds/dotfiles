#!/usr/bin/env fish

mkdir ~/.vim/

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# symlink vimrc
ln -isv ~/dotfiles/vim/vimrc ~/.vim/vimrc

# install plugins
vim -c ':PlugInstall' -c 'qa!'
