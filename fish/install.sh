#!/usr/bin/env fish

# set fish as default shell
chsh -s /usr/bin/fish

# install oh-my-fish
curl -L http://get.oh-my.fish | fish

# install oh-my-fish packages
omf install fasd

# add abbreviations
source abbr.fish

# symlink stuff
ln -isv "~/dotfiles/fish/config.fish" "~/.config/fish/config.fish"