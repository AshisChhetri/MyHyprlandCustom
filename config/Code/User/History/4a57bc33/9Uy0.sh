#!/bin/bash

file="text.sh"

line_no=4

theme_name=$(ls ~/.config/alacritty/themes/themes | wofi --dmenu --lines 10)

if [ -n "$theme_name" ]; theme_name
new_line=" - ~/.config/alacritty/themes/themes/${theme_name}"

sed -i "${line_no}s|.*|$new_line|" "$file"
fi
