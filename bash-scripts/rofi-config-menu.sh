#!/usr/bin/bash

TERMINAL="kitty"

# Give user a rofi prompt
choice=$(echo "NeoVIM|i3 WM|Bashrc|Rofi|Config Menu" | rofi -sep '|' -dmenu -p "Config: " )

# Set lua_path accordingly (NeoVIM config modules)
export LUA_PATH="$HOME/.config/nvim/?.lua;$LUA_PATH"

if [ "$choice" = "i3 WM" ]; then
    $TERMINAL -- nvim ~/.config/i3/config 

elif [ "$choice" = "NeoVIM" ]; then
    # Choose one of the configs
    choice=$(echo "init.lua|settings.lua|highlights.lua|plugins.lua" | rofi -sep '|' -dmenu -p "NeoVIM: " )
    
    if [ "$choice" = "init.lua" ]; then
        $TERMINAL -- nvim ~/.config/nvim/init.lua 

    elif [ "$choice" = "settings.lua" ]; then
        $TERMINAL -- nvim ~/.config/nvim/settings.lua 

    elif [ "$choice" = "highlights.lua" ]; then
        $TERMINAL -- nvim ~/.config/nvim/highlights.lua 

    elif [ "$choice" = "plugins.lua" ]; then
        $TERMINAL -- nvim ~/.config/nvim/highlights.lua 
    
    fi

elif [ "$choice" = "Bashrc" ]; then
    $TERMINAL -- nvim ~/.bashrc 
    
elif [ "$choice" = "Rofi" ]; then
    $TERMINAL -- nvim ~/.config/rofi/config.rasi 

elif [ "$choice" = "Config Menu" ]; then
    $TERMINAL -- nvim ~/bash-scripts/rofi-config-menu.sh 
    
fi

