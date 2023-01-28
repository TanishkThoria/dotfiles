#!/usr/bin/bash

# Give user a rofi prompt
choice=$(echo "NeoVIM|Awesome WM|Bashrc|Rofi|Config Menu" | rofi -sep '|' -dmenu -p "Config:")

# Set lua_path accordingly (NeoVIM config modules)
export LUA_PATH="$HOME/.config/nvim/?.lua;$LUA_PATH"

if [ "$choice" = "Awesome WM" ]; then
    # Choose one of the configs
    choice=$(echo "rc.lua|theme.lua" | rofi -sep '|' -dmenu -p "Awesome WM:")

    if [ "$choice" = "rc.lua" ]; then
        gnome-terminal -- nvim ~/.config/awesome/rc.lua

    elif [ "$choice" = "theme.lua" ]; then
        gnome-terminal -- nvim ~/.config/awesome/themes/powerarrow/theme.lua
    fi

elif [ "$choice" = "NeoVIM" ]; then
    # Choose one of the configs
    choice=$(echo "init.lua|settings.lua|highlights.lua|plugins.lua|oldinit.vim" | rofi -sep '|' -dmenu -p "NeoVIM:")
    
    if [ "$choice" = "init.lua" ]; then
        gnome-terminal -- nvim ~/.config/nvim/init.lua

    elif [ "$choice" = "settings.lua" ]; then
        gnome-terminal -- nvim ~/.config/nvim/settings.lua

    elif [ "$choice" = "highlights.lua" ]; then
        gnome-terminal -- nvim ~/.config/nvim/highlights.lua

    elif [ "$choice" = "plugins.lua" ]; then
        gnome-terminal -- nvim ~/.config/nvim/highlights.lua

    elif [ "$choice" = "oldinit.vim" ]; then
        gnome-terminal -- nvim ~/.config/nvim/oldinit.vim
    
    fi

elif [ "$choice" = "Bashrc" ]; then
    gnome-terminal -- nvim ~/.bashrc
    
elif [ "$choice" = "Rofi" ]; then
	gnome-terminal -- nvim ~/.config/rofi/config.rasi

elif [ "$choice" = "Config Menu" ]; then
    gnome-terminal -- nvim ~/bash-scripts/rofi-config-menu.sh
    
fi

