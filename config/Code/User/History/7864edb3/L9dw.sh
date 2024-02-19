#!/bin/bash

tmp=$(virsh list --all | grep " win10-base " | awk '{ print $3}')
if ([ "x$tmp" == "x" ] || [ "x$tmp" != "xrunning" ])
then
    echo "VM does not exist or is shut down!"
    # Try additional commands here...
    virsh --connect qemu:///system start win10-base
    sleep 5
    
else
    echo "vm is running."
fi


# virsh --connect qemu:///system start win10-base
# sleep 5

# looking-glass-client

# WOFI STYLES
CONFIG="$HOME/.config/hypr/wofi/WofiBig/config"
STYLE="$HOME/.config/hypr/wofi/style.css"
COLORS="$HOME/.config/hypr/wofi/colors"

# wofi window config (in %)
WIDTH=20
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
            
            xfreerdp -grab-keyboard /v:192.168.122.3 /u:ashis /p:root098 /size:100% /d: /dynamic-resolution /gfx-h264:avc444 +gfx-progressive 
            ;;
        *)
            looking-glass-client
            ;;
    esac
}
main
            
