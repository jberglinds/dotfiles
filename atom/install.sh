#!/usr/bin/env bash

# symlink stuff
ln -isv $HOME/dotfiles/atom/config.cson $HOME/.atom/config.cson

# install packages
apm install --packages-file packages.txt

# backup packages with:
# apm list --installed --bare | grep '^[^@]\+' -o
