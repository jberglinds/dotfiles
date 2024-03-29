# remove annoying welcome message
set fish_greeting ""

source ~/dotfiles/fish/abbr.fish

eval (/opt/homebrew/bin/brew shellenv fish)

zoxide init fish | source

set -x LANG "en_US.UTF-8"

fish_add_path /opt/homebrew/bin

# Use powerline symbols for bobthefish prompt
set -g theme_powerline_fonts yes
set -g theme_color_scheme light

# use neovim instead of vim
alias vim nvim
alias view 'nvim -R'
alias vimdiff 'nvim -d'

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
			ssh 'jonatber@u-shell.csc.kth.se' -XY
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
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# kill ports easily
function ...
	cd ../.. $argv;
end

function ....
	cd ../../.. $argv;
end

# saving my ass
alias cp='cp -i'
alias mv='mv -i'

# thefuck
thefuck --alias | source

# git stuff
alias git='hub'

# nicer grep
alias grep='grep --color=auto'

# easily show and hide hidden files in Finder
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# edit vimrc easily
alias vimconf='vim ~/.vim/vimrc'

# iTerm2 shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish


set -x TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE /var/run/docker.sock
set -x DOCKER_HOST "unix://$HOME/.colima/docker.sock"

fish_add_path /opt/homebrew/opt/mysql-client/bin
fish_add_path ~/.emacs.d/bin

# KRY config
if test -e ~/.config/fish/kry_config.fish
	source ~/.config/fish/kry_config.fish
end

# Created by `pipx` on 2022-12-23 09:12:51
set PATH $PATH /Users/jonathan/.local/bin

