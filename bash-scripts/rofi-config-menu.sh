#!/usr/bin/bash

# Applications
TERMINAL=""
sep="" # see man page of your terminal emulator for how to run programs
EDITOR="command emacsclient -c -a 'emacs'" # emacs is not a terminal application (unlike vim), so terminal and separator vars will be left blank

# Give user a rofi prompt
choice=$(echo "i3 WM|Picom|Polybar|Doom Emacs|NeoVIM|Kitty|Bashrc|Starship|Rofi|Config Menu" | rofi -sep '|' -dmenu -p "Config: " )

# Set lua_path accordingly (NeoVIM config modules)
export LUA_PATH="$HOME/.config/$EDITOR/?.lua;$LUA_PATH"

if [ "$choice" = "i3 WM" ]; then
    $TERMINAL $sep $EDITOR ~/.config/i3/config 

elif [ "$choice" = "Picom" ]; then
    $TERMINAL $sep $EDITOR ~/.config/picom/picom.conf

elif [ "$choice" = "Polybar" ]; then
    $TERMINAL $sep $EDITOR ~/.config/polybar/config.ini

elif [ "$choice" = "Doom Emacs" ]; then
    # Choose one of the configs
    choice=$(echo "init.el|config.el|packages.el" | rofi -sep '|' -dmenu -p "Doom Emacs: " )

    if [ "$choice" = "init.el" ]; then
        $TERMINAL $sep $EDITOR ~/.doom.d/init.el

    elif [ "$choice" = "config.el" ]; then
        $TERMINAL $sep $EDITOR ~/.doom.d/config.el

    elif [ "$choice" = "packages.el" ]; then
        $TERMINAL $sep $EDITOR ~/.doom.d/packages.el

    fi

elif [ "$choice" = "NeoVIM" ]; then
    # Choose one of the configs
    choice=$(echo "init.lua|settings.lua|highlights.lua|plugins.lua" | rofi -sep '|' -dmenu -p "NeoVIM: " )
    
    if [ "$choice" = "init.lua" ]; then
        $TERMINAL $sep $EDITOR ~/.config/nvim/init.lua 

    elif [ "$choice" = "settings.lua" ]; then
        $TERMINAL $sep $EDITOR ~/.config/nvim/settings.lua 

    elif [ "$choice" = "highlights.lua" ]; then
        $TERMINAL $sep $EDITOR ~/.config/nvim/highlights.lua 

    elif [ "$choice" = "plugins.lua" ]; then
        $TERMINAL $sep $EDITOR ~/.config/nvim/plugins.lua 
    
    fi

elif [ "$choice" = "Kitty" ]; then
     # Choose one of the configs
    choice=$(echo "kitty.conf|dracula-dark-colors.conf|elenapan-colors.conf" | rofi -sep '|' -dmenu -p "Kitty: " )
    
    if [ "$choice" = "kitty.conf" ]; then
        $TERMINAL $sep $EDITOR ~/.config/kitty/kitty.conf

    elif [ "$choice" = "dracula-dark-colors.conf" ]; then
        $TERMINAL $sep $EDITOR ~/.config/kitty/dracula-dark-colors.conf
    
    elif [ "$choice" = "elenapan-colors.conf" ]; then
        $TERMINAL $sep $EDITOR ~/.config/kitty/elenapan-colors.conf

    fi

elif [ "$choice" = "Bashrc" ]; then
    $TERMINAL $sep $EDITOR ~/.bashrc 
    
elif [ "$choice" = "Starship" ]; then
    $TERMINAL $sep $EDITOR ~/.config/starship/starship.toml

elif [ "$choice" = "Rofi" ]; then
    $TERMINAL $sep $EDITOR ~/.config/rofi/config.rasi 

elif [ "$choice" = "Config Menu" ]; then
    $TERMINAL $sep $EDITOR ~/bash-scripts/rofi-config-menu.sh 
    
fi

