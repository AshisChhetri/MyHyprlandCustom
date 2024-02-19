#!/bin/bash

file="$HOME/.config/alacritty/alacritty.yml"

# WOFI STYLES
CONFIG="$HOME/.config/hypr/wofi/WofiBig/config"
STYLE="$HOME/.config/hypr/wofi/style.css"
COLORS="$HOME/.config/hypr/wofi/colors"

# wofi window config (in %)
# WIDTH=20
# HEIGHT=30

# wofi window
wofi_command="wofi --show dmenu --height=1000\
			--prompt choose to view or edit...
			--conf $CONFIG --style $STYLE --color $COLORS \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--matching=fuzzy"

line_no=4

theme_name=$(ls ~/.config/alacritty/themes/themes | ${wofi_command})

if [ -n "$theme_name" ]; then
new_line=" - ~/.config/alacritty/themes/themes/${theme_name}"

sed -i "${line_no}s|.*|$new_line|" "$file"

fi
