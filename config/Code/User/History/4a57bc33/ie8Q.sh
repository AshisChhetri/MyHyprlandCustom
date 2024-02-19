#!/bin/bash

file="text.sh"

line_no=4

name="ashis"

new_line=" - ~/.config/alacritty/themes/themes/${name}.yaml"

sed -i "${line_no}s|.*|$new_line|" "$file"