#!/bin/bash

file="test.sh"

line_no=4

new_line=" - ~/.config/alacritty/themes/themes/github_dark.yaml"

sed -i "${line_no}s|.*|$new_line|" "$file"