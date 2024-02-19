#!/bin/bash


virsh --connect qemu:///system start win10-base
sleep 5

looking-glass-client



# # WOFI STYLES
# CONFIG="$HOME/.config/hypr/wofi/WofiBig/config"
# STYLE="$HOME/.config/hypr/wofi/style.css"
# COLORS="$HOME/.config/hypr/wofi/colors"

# # wofi window config (in %)
# WIDTH=20
# HEIGHT=30

# ## Wofi Command
# wofi_command="wofi --show dmenu \
# 			--prompt choose to view or edit...
# 			--conf $CONFIG --style $STYLE --color $COLORS \
# 			--width=$WIDTH% --height=$HEIGHT% \
# 			--cache-file=/dev/null \
# 			--hide-scroll --no-actions \
# 			--matching=fuzzy"


# menu(){
#   printf "1. Looking Glass Client\n"
#   printf "2. free RDP \n"
# }
# main() {
#     choice=$(menu | ${wofi_command} | cut -d. -f1)
#     case $choice in
        
#         1)
#             looking-glass-client
#             ;;
#         2)
#             xfreerdp -grab-keyboard /v:192.168.122.51 /u:ashis /p:root098 /size:100% /d: /dynamic-resolution /gfx-h264:avc444 +gfx-progressive 
#             ;;
#         *)
#             looking-glass-client
#             ;;
#     esac
# }
# main
            
    # <input type="evdev">
    #   <source dev="/dev/input/by-id/usb-Logitech_G102_Prodigy_Gaming_Mouse_1068385D3734-event-mouse"/>
    # </input>
    # <input type="evdev">
    #   <source dev="/dev/input/by-id/usb-Compx_2.4G_Wireless_Receiver-event-kbd" grab="all" grabToggle="ctrl-ctrl" repeat="on"/>
    # </input>

    # <shmem name="looking-glass">
    #   <model type="ivshmem-plain"/>
    #   <size unit="M">32</size>
    #   <address type="pci" domain="0x0000" bus="0x10" slot="0x01" function="0x0"/>
    # </shmem>