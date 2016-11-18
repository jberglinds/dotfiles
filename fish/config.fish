# path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# load Oh My Fish configuration.
source $OMF_PATH/init.fish

# remove annoying welcome message
set fish_greeting ""

# set prompt to powerline-shell
function fish_prompt
    ~/dotfiles/fish/powerline-shell.py $status --shell bare ^/dev/null
end

# ssh and sftp to kth servers
function kth
  switch $argv[1]
  case ssh
    if set -q argv[2]
      ssh $argv[2]@u-shell.csc.kth.se -XY
    else
      ssh 'jonatber@u-shell.csc.kth.se' -XY
    end
  case sftp
    if set -q argv[2]
      sftp $argv[2]@u-shell.csc.kth.se
    else
      sftp 'jonatber@u-shell.csc.kth.se'
    end
  end
end

# moving around folders
function -
  cd -
end

function ...
  cd ../.. $argv;
end

function ....
  cd ../../.. $argv;
end

# saving my ass
alias cp='cp -i'
alias mv='mv -i'

# git stuff
alias git='hub'

alias grep='grep --color=auto'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
