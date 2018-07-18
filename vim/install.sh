#!/usr/bin/env fish
mkdir -p ~/.vim ~/.nvim ~/.config/nvim

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# symlink dotfiles vimrc to .vim/vimrc
ln -isv ~/dotfiles/vim/vimrc ~/.vim/vimrc
# symlink vim stuff to neovim
ln -isv ~/.vim/vimrc ~/.config/nvim/init.vim
ln -isv ~/.vim/autoload ~/.nvim/autoload

# install plugins
vim -c ':PlugInstall' -c 'qa!'
