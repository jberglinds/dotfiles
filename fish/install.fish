# add fish as an acceptable shell
which fish | sudo tee -a /etc/shells > /dev/null

# set fish as default shell
chsh -s (which fish)

# install oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# install oh-my-fish packages
omf install fasd
omf install bobthefish

# add abbreviations
source ~/dotfiles/fish/abbr.fish

# symlink stuff
ln -isv ~/dotfiles/fish/config.fish ~/.config/fish/config.fish

# Install fzf extras
sh (brew --prefix)/opt/fzf/install
