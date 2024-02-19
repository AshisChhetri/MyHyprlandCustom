#!/bin/bash

# WOFI STYLES
CONFIG="$HOME/.config/hypr/wofi/WofiBig/config"
STYLE="$HOME/.config/hypr/wofi/style.css"
COLORS="$HOME/.config/hypr/wofi/colors"

#!/bin/bash
virsh --connect qemu:///system start win10-base
sleep 30
# wofi window config (in %)
WIDTH=10
HEIGHT=30

## Wofi Command
wofi_command="wofi --show dmenu \
			--prompt choose to view or edit...
			--conf $CONFIG --style $STYLE --color $COLORS \
			--width=$WIDTH% --height=$HEIGHT% \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--matching=fuzzy"


menu(){
  printf "1. Looking Glass Client\n"
  printf "2. free RDP \n"
}
main() {
    choice=$(menu | ${wofi_command} | cut -d. -f1)
    case $choice in
        
        1)
            looking-glass-client
            ;;
        2)
            xfreerdp -grab-keyboard /v:192.168.122.51 /u:ashis /p:root098 /size:100% /d: /dynamic-resolution /gfx-h264:avc444 +gfx-progressive 
            ;;
        *)
            looking-glass-client
            ;;
            