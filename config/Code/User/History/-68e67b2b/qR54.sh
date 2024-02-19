#!/bin/bash

# WOFI STYLES
CONFIG="$HOME/.config/hypr/wofi/WofiBig/config"
STYLE="$HOME/.config/hypr/wofi/style.css"
COLORS="$HOME/.config/hypr/wofi/colors"

hyprDir="$HOME/.config/hypr/configs"

# wofi window config (in %)
WIDTH=20
HEIGHT=35

## Wofi Command
wofi_command="wofi --show dmenu \
			--prompt choose to view or edit...
			--conf $CONFIG --style $STYLE --color $COLORS \
			--width=$WIDTH% --height=$HEIGHT% \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--matching=fuzzy"


menu(){
  printf "1. On VS code\n"
  printf "2. view Env-variables\n"
  printf "3. view Rules\n"
  printf "4. view Execs\n"
  printf "5. view Key-Binds\n"
  printf "6. view Monitors\n"
  printf "7. view Hyprland-Settings\n"
}

main() {
    choice=$(menu | ${wofi_command} | cut -d. -f1)
    case $choice in
        1)
            code "$hyprDir"
            
            ;;
        2)
            foot -e vim "$hyprDir/ENVariables.conf"
            ;;
        3)
            foot -e vim "$hyprDir/WindowRules.conf"
            ;;
        4)
            foot -e vim "$hyprDir/Execs.conf"
            ;;
        5)
            foot -e vim "$hyprDir/Keybinds.conf"
            ;;
        6)
            foot -e vim "$hyprDir/Monitors.conf"
            ;;
        7)
            foot -e vim "$hyprDir/Settings.conf"
            ;;
        *)
            ;;
    esac
}

main