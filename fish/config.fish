# remove annoying welcome message
set fish_greeting ""

# Use powerline symbols for bobthefish prompt
set -g theme_powerline_fonts yes

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

# fasd without args uses fzf
function z
	set -l dir (fasd -Rdl $argv[1] | fzf -1 -0 --no-sort +m); and cd $dir; return 1
end

# kill ports easily
function killport
	if set -q argv[1]
		kill -9 (lsof -t -i:$argv[1])
	end
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
