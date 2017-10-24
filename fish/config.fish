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

# ctrl-p searches files with fzf and opens in vim
function fish_user_key_bindings
	bind \cp 'fzf | read -l result; and vim $result';
	fzf_key_bindings
end

# easy ssh to kth servers
function ssh
	if set -q argv[1]
		switch $argv[1]
	case kth
		if set -q argv[2]
			ssh $argv[2]@u-shell.csc.kth.se -XY
		else
			ssh 'jonatber@u-shell.csc.kth.se'
		end
	case '*'
		command ssh $argv
	end
	else
		command ssh
	end
end

# easy sftp to kth servers
function sftp
	if set -q argv[1]
		switch $argv[1]
	case kth
		if set -q argv[2]
			sftp $argv[2]@u-shell.csc.kth.se
		else
			sftp 'jonatber@u-shell.csc.kth.se'
		end
	case '*'
		command sftp $argv
	end
	else
		command sftp
	end
end

# Use ripgrep for fzf by default
set FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# fasd without args uses fzf
function z
	set -l dir (fasd -Rdl $argv[1] | fzf -1 -0 --no-sort +m); and cd $dir; return 1
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
