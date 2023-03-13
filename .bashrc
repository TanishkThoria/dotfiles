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

# Include cargo in path
export PATH="$PATH:$HOME/.cargo/env"

# ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# Use vim keybindings for terminal
set -o vi

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

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### Command Cheat Sheets
# usage: cht <command>
function cht () {
    curl cht.sh/$1
}

# Aliases

# Replace tldr with cht function (see above)
alias tldr="cht"

# Emacs client for faster launch (requires emacs daemon) [with fallback of normal emacs]
alias emacs="emacsclient -c -a 'emacs'"
# Emacs in terminal mode (same deal. first try daemon, fallback of normal)
alias em="emacsclient -nw -a 'emacs -nw'"

# Confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Use ripgrep instead of grep for faster speed
alias grep="rg"

# Use bat instead of cat for nicer features 
alias cat="bat"

# Use exa instead of ls for nicer colors
alias ls="exa -al --color=always --group-directories-first"
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# Git shorthands:
alias gcom="git add -A; git commit"
alias cfg='/usr/bin/git --git-dir=/home/tanishk/.cfg/ --work-tree=/home/tanishk'
