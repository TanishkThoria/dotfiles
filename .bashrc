# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# LUA_PATH has .config/nvim added so that NeoVIM config files can be found
export LUA_PATH="$HOME/.config/nvim/?.lua;$LUA_PATH"

# Set default editor to NeoVIM
# export EDITOR="/bin/nvim" 

# Include doom emacs in path 
export PATH="$HOME/.emacs.d/bin:$PATH"

# ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Neofetch
neofetch
echo ""
echo ""

# Starship prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init bash)"

# Zoxide (similar to autojump)
export _ZO_ECHO='1'
eval "$(zoxide init bash)"

# Aliases

# Emacs client for faster launch (requires emacs daemon)
alias emacs="emacsclient -c -a 'emacs'"

# Confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Use ripgrep instead of grep for faster speed
alias grep="rg"

# Use exa instead of ls for nicer colors
alias ls="exa -al --color=always --group-directories-first"
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# Git shorthands:
alias gcom="git add -A; git commit"
alias cfg='/usr/bin/git --git-dir=/home/tanishk/.cfg/ --work-tree=/home/tanishk'

# Easy hugo site visualization
alias localhost="cd ~/websiteProject/Personal-Website; hugo server -D; cd -"
