#!/bin/bash

file="$HOME/.config/alacritty/alacritty.yml"

# WOFI STYLES
CONFIG="$HOME/.config/hypr/wofi/WofiBig/config"
STYLE="$HOME/.config/hypr/wofi/style.css"
COLORS="$HOME/.config/hypr/wofi/colors"


line_no=4

theme_name=$(ls ~/.config/alacritty/themes/themes | wofi --dmenu --lines 10)

if [ -n "$theme_name" ]; then
new_line=" - ~/.config/alacritty/themes/themes/${theme_name}"

sed -i "${line_no}s|.*|$new_line|" "$file"

fi
