#!/usr/bin/bash

terminal = "kitty"

# Give user a rofi prompt
choice=$(echo "NeoVIM|Awesome WM|Bashrc|Rofi|Config Menu" | rofi -sep '|' -dmenu -p "Config:")

# Set lua_path accordingly (NeoVIM config modules)
export LUA_PATH="$HOME/.config/nvim/?.lua;$LUA_PATH"

if [ "$choice" = "Awesome WM" ]; then
    # Choose one of the configs
    choice=$(echo "rc.lua|theme.lua" | rofi -sep '|' -dmenu -p "Awesome WM:")

    if [ "$choice" = "rc.lua" ]; then
        terminal .. -- nvim ~/.config/awesome/rc.lua

    elif [ "$choice" = "theme.lua" ]; then
        terminal .. -- nvim ~/.config/awesome/themes/powerarrow/theme.lua
    fi

elif [ "$choice" = "NeoVIM" ]; then
    # Choose one of the configs
    choice=$(echo "init.lua|settings.lua|highlights.lua|plugins.lua|oldinit.vim" | rofi -sep '|' -dmenu -p "NeoVIM:")
    
    if [ "$choice" = "init.lua" ]; then
        terminal .. -- nvim ~/.config/nvim/init.lua

    elif [ "$choice" = "settings.lua" ]; then
        terminal .. -- nvim ~/.config/nvim/settings.lua

    elif [ "$choice" = "highlights.lua" ]; then
        terminal .. -- nvim ~/.config/nvim/highlights.lua

    elif [ "$choice" = "plugins.lua" ]; then
        terminal .. -- nvim ~/.config/nvim/highlights.lua

    elif [ "$choice" = "oldinit.vim" ]; then
        terminal .. -- nvim ~/.config/nvim/oldinit.vim
    
    fi

elif [ "$choice" = "Bashrc" ]; then
    terminal .. -- nvim ~/.bashrc
    
elif [ "$choice" = "Rofi" ]; then
	terminal .. -- nvim ~/.config/rofi/config.rasi

elif [ "$choice" = "Config Menu" ]; then
    terminal .. -- nvim ~/bash-scripts/rofi-config-menu.sh
    
fi

