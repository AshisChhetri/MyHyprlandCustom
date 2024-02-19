#!/bin/bash
# https://github.com/JaKooLit

# edit your packages desired here. 
# WARNING! If you remove packages here, dotfiles may not work properly.
# and also, ensure that packages are present in AUR and official Arch Repo

# add packages wanted here
Extra=(

)

hypr_package=( 
cliphist
dunst 
alacritty
grim 
gvfs 
gvfs-mtp 
jq  
network-manager-applet 
bc
pamixer 
pavucontrol
pipewire-alsa 
playerctl
polkit-kde-agent 
python-requests 
qt5ct 
slurp 
swappy 
swayidle 
swaylock-effects 
swww 
waybar
wget
wl-clipboard 
wlogout
wofi 
xdg-user-dirs 
)

# the following packages can be deleted. however, dotfiles may not work properly
hypr_package_2=(
brightnessctl 
cava
ffmpegthumbs
mission-center 
mousepad 
mpv
 
nano
nvtop
nwg-look-bin
swaybg
viewnior
wlsunset
)

fonts=(
adobe-source-code-pro-fonts 
noto-fonts-emoji
otf-font-awesome 
otf-font-awesome-4 
ttf-droid 
ttf-fantasque-sans-mono 
ttf-jetbrains-mono 
ttf-jetbrains-mono-nerd 
)


# Check if running as root. If root, script will exit
if [[ $EUID -eq 0 ]]; then
	echo "This script should not be executed as root! Exiting......."
	exit 1
fi


# Set some colors for output messages
OK="$(tput setaf 2)[OK]$(tput sgr0)"
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
NOTE="$(tput setaf 3)[NOTE]$(tput sgr0)"
WARN="$(tput setaf 166)[WARN]$(tput sgr0)"
CAT="$(tput setaf 6)[ACTION]$(tput sgr0)"
ORANGE=$(tput setaf 166)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

# Set the name of the log file to include the current date and time
LOG="install-$(date +%d-%H%M%S).log"

#clear screen
clear

# Get the width of the terminal
TERM_WIDTH=$(tput cols)

# Calculate the padding for the message
MESSAGE="Welcome to my Arch-Hyprland-V3 Installer"
PAD_LENGTH=$(( ($TERM_WIDTH - ${#MESSAGE}) / 2 ))

# Set the color to green
GREN='\033[0;32m'
NC='\033[0m' # No Color

# Display the message with thicker width and green color
printf "${GREN}+$(printf '%*s' "$((TERM_WIDTH-1))" '' | tr ' ' -)+${NC}\n"
printf "${GREN}|%*s${MESSAGE}%*s|${NC}\n" $PAD_LENGTH "" $PAD_LENGTH ""
printf "${GREN}+$(printf '%*s' "$((TERM_WIDTH-1))" '' | tr ' ' -)+${NC}\n"

sleep 2

# Print backup warning message
printf "${ORANGE}$(tput smso)PLEASE BACKUP YOUR FILES BEFORE PROCEEDING!$(tput rmso)\n"
printf "${YELLOW} Although I will attempt to backup your files!\n"
printf "\n"
printf "\n"
sleep 2

# Print password warning message
printf "\n${YELLOW} Some commands require you to enter your password in order to execute.\n"
printf " If you are worried about entering your password, you can cancel the script now with CTRL+C and review the contents of this script.${RESET}\n"
sleep 2
printf "\n"
printf "\n"

# Print VM warning message
printf "\n${NOTE} If you are installing on a VM (virtual box, VMWARE, QEMU-KVM), kindly ensure that 3D acceleration is enabled.\n"
printf "Hyprland's performance on a Virtual Environment is abysmal... worst at its best. and it may not start at all!! YOU HAVE BEEN WARNED .${RESET}\n"
sleep 2
printf "\n"
printf "\n"

# Print system-update warning message
printf "\n${NOTE} If you have not perform a full system update for a while, cancel the script by pressing CTRL c and perform a full system update first\n"
printf "${WARN} If there is a kernel update, reboot first your system and re-run script. Script may fail if not updated. .${RESET}\n"
sleep 2
printf "\n"
printf "\n"

# proceed
read -n1 -rep "${CAT} Shall we proceed with installation (y/n) " PROCEED
    echo
if [[ $PROCEED =~ ^[Yy]$ ]]; then
    printf "\n%s  Alright.....LETS BEGIN!.\n" "${OK}"
else
    printf "\n%s  NO changes made to your system. Goodbye.!!!\n" "${NOTE}"
    exit
fi

#clear screen
clear

# Check for AUR helper and install if not found
ISAUR=$(command -v yay || command -v paru)

if [ -n "$ISAUR" ]; then
  printf "\n%s - AUR helper was located, moving on.\n" "${OK}"
else
  printf "\n%s - AUR helper was NOT located\n" "$WARN"

  while true; do
    read -rp "${CAT} Which AUR helper do you want to use, yay or paru? Enter 'y' or 'p': " choice
    case "$choice" in
      y|Y)
        printf "\n%s - Installing yay from AUR\n" "${NOTE}"
        git clone https://aur.archlinux.org/yay-bin.git || { printf "%s - Failed to clone yay from AUR\n" "${ERROR}"; exit 1; }
        cd yay-bin || { printf "%s - Failed to enter yay-bin directory\n" "${ERROR}"; exit 1; }
        makepkg -si --noconfirm 2>&1 | tee -a "$LOG" || { printf "%s - Failed to install yay from AUR\n" "${ERROR}"; exit 1; }
        cd ..
        break
        ;;
      p|P)
        printf "\n%s - Installing paru from AUR\n" "${NOTE}"
        git clone https://aur.archlinux.org/paru-bin.git || { printf "%s - Failed to clone paru from AUR\n" "${ERROR}"; exit 1; }
        cd paru-bin || { printf "%s - Failed to enter paru-bin directory\n" "${ERROR}"; exit 1; }
        makepkg -si --noconfirm 2>&1 | tee -a "$LOG" || { printf "%s - Failed to install paru from AUR\n" "${ERROR}"; exit 1; }
        cd ..
        break
        ;;
      *)
        printf "%s - Invalid choice. Please enter 'y' or 'p'\n" "${ERROR}"
        continue
        ;;
    esac
  done
fi

# Clear screen
clear

# Update system before proceeding
printf "\n%s - Performing a full system update to avoid issues.... \n" "${NOTE}"
ISAUR=$(command -v yay || command -v paru)

$ISAUR -Syu --noconfirm 2>&1 | tee -a "$LOG" || { printf "%s - Failed to update system\n" "${ERROR}"; exit 1; }

#clear screen
clear

# Set the script to exit on error
set -e

# Function for installing packages
install_package() {
  # Checking if package is already installed
  if $ISAUR -Q "$1" &>> /dev/null ; then
    echo -e "${OK} $1 is already installed. Skipping..."
  else
    # Package not installed
    echo -e "${NOTE} Installing $1 ..."
    $ISAUR -S --noconfirm "$1" 2>&1 | tee -a "$LOG"
    # Making sure package is installed
    if $ISAUR -Q "$1" &>> /dev/null ; then
      echo -e "\e[1A\e[K${OK} $1 was installed."
    else
      # Something is missing, exiting to review log
      echo -e "\e[1A\e[K${ERROR} $1 failed to install :( , please check the install.log. You may need to install manually! Sorry I have tried :("
      exit 1
    fi
  fi
}

# Function to print error messages
print_error() {
    printf " %s%s\n" "${ERROR}" "$1" "$NC" 2>&1 | tee -a "$LOG"
}

# Function to print success messages
print_success() {
    printf "%s%s%s\n" "${OK}" "$1" "$NC" 2>&1 | tee -a "$LOG"
}

# Exit immediately if a command exits with a non-zero status.
set -e 

## ---- here Hyprland Install nvidia 

# Clear screen
clear

# Installation of other components needed
printf "\n%s - Installing other necessary packages.... \n" "${NOTE}"

for PKG1 in "${hypr_package[@]}" "${hypr_package_2[@]}" "${fonts[@]}" "${Extra[@]}"; do
  install_package "$PKG1" 2>&1 | tee -a "$LOG"
  if [ $? -ne 0 ]; then
    echo -e "\e[1A\e[K${ERROR} - $PKG1 install had failed, please check the install.log"
    exit 1
  fi
done

echo
print_success "All necessary packages installed successfully."
sleep 2

# Clear screen
clear

# Themes and cursors
printf "\n${NOTE} GTK THEMES ARE NEEDED FOR DARK-LIGHT TRANSITION! \n"
read -n1 -rep "${CAT} OPTIONAL - Would you like to install GTK Themes and Cursors? (y/n)" theme
if [[ $theme =~ ^[Yy]$ ]]; then
  while true; do
    read -rp "${CAT} Which GTK Theme and Cursors to install? Catppuccin or Tokyo Theme? Enter 'c' or 't': " choice
    case "$choice" in
      c|C)
        printf "${NOTE} Installing Catpuccin Theme packages...\n"
        for THEME1 in catppuccin-gtk-theme-mocha catppuccin-gtk-theme-latte catppuccin-cursors-mocha; do
          install_package "$THEME1" 2>&1 | tee -a "$LOG"
          [ $? -ne 0 ] && { echo -e "\e[1A\e[K${ERROR} - $THEME1 install had failed, please check the install.log"; exit 1; }
        done
        # Shiny-Dark-Icons-themes
        mkdir -p ~/.icons
        cd assets
        tar -xf Shiny-Dark-Icons.tar.gz -C ~/.icons
        tar -xf Shiny-Light-Icons.tar.gz -C ~/.icons
        cd ..
        sed -i '9,12s/#//' config/hypr/scripts/DarkLight.sh
        sed -i '9,12s/#//' config/hypr/scripts/DarkLight-swaybg.sh
        sed -i '31s/#//' config/hypr/configs/Settings.conf
        cp -f 'config/hypr/waybar/style/dark-styles/style-dark-cat.css' 'config/hypr/waybar/style/style-dark.css'
        break
        ;;
      t|T)
        printf "${NOTE} Installing Tokyo Theme packages...\n"
        wget https://github.com/ljmill/tokyo-night-icons/releases/download/v0.2.0/TokyoNight-SE.tar.bz2
        mkdir -p ~/.icons
        tar -xvjf TokyoNight-SE.tar.bz2 -C ~/.icons
        mkdir -p ~/.themes
        cp -r -f assets/tokyo-themes/* ~/.themes/
        sed -i '15,18s/#//' config/hypr/scripts/DarkLight.sh
        sed -i '15,18s/#//' config/hypr/scripts/DarkLight-swaybg.sh
        sed -i '32s/#//' config/hypr/configs/Settings.conf
        cp -f 'config/hypr/waybar/style/dark-styles/style-dark-tokyo.css' 'config/hypr/waybar/style/style-dark.css'
        break
        ;;
      *)
        printf "%s - Invalid choice. Please enter 'c' or 't'\n" "${ERROR}"
        continue
        ;;
    esac
  done
else
  printf "${NOTE} No themes will be installed..\n"
fi

# Clear screen
clear

# Additional packages (File Manager)
read -n1 -rep "${CAT} OPTIONAL - Would you like to install Thunar as a file manager? (y/n)" inst3
echo

if [[ $inst3 =~ ^[Yy]$ ]]; then
  for THUNAR in thunar thunar-volman tumbler thunar-archive-plugin; do
    install_package "$THUNAR" 2>&1 | tee -a "$LOG"
    [ $? -ne 0 ] && { echo -e "\e[1A\e[K${ERROR} - $THUNAR install had failed, please check the install.log"; exit 1; }
  done

  # Check for existing config folders and backup
  for DIR1 in Thunar xfce4; do
    DIRPATH=~/.config/$DIR1
    if [ -d "$DIRPATH" ]; then
      echo -e "${NOTE} Config for $DIR1 found, backing up."
      mv $DIRPATH $DIRPATH-back-up 2>&1 | tee -a "$LOG"
      echo -e "${NOTE} Backed up $DIR1 to $DIRPATH-back-up."
    fi
  done
  cp -r config/xfce4 ~/.config/ && { echo "Copy xfce4 completed!"; } || { echo "Error: Failed to copy xfce4 config files."; exit 1; } 2>&1 | tee -a "$LOG"
  cp -r config/Thunar ~/.config/ && { echo "Copy Thunar completed!"; } || { echo "Error: Failed to copy Thunar config files."; exit 1; } 2>&1 | tee -a "$LOG"
else
  printf "${NOTE} Thunar will not be installed.\n"
fi

# Clear screen
clear

# Bluetooth
read -n1 -rep "${CAT} OPTIONAL - Would you like to install Bluetooth packages? (y/n)" inst4
if [[ $inst4 =~ ^[Yy]$ ]]; then
  printf "${NOTE} Installing Bluetooth Packages...\n"
  for BLUE in bluez bluez-utils blueman; do
    install_package "$BLUE" 2>&1 | tee -a "$LOG"
    [ $? -ne 0 ] && { echo -e "\e[1A\e[K${ERROR} - $BLUE install had failed, please check the install.log"; exit 1; }
  done

  printf " Activating Bluetooth Services...\n"
  sudo systemctl enable --now bluetooth.service 2>&1 | tee -a "$LOG"
else
  printf "${NOTE} No Bluetooth packages installed..\n"
fi

# Clear screen
clear

# SDDM install
read -n1 -rep "${CAT} OPTIONAL - Would you like to install SDDM as the login manager? (y/n)" install_sddm
echo

if [[ $install_sddm =~ ^[Yy]$ ]]; then
  # Check if SDDM is already installed
  if pacman -Qs sddm > /dev/null; then
    # Prompt user to manually install sddm-git to remove SDDM
    read -n1 -rep "SDDM is already installed. Would you like to manually install sddm-git to remove it? This requires manual intervention. (y/n)" manual_install_sddm
    echo
    if [[ $manual_install_sddm =~ ^[Yy]$ ]]; then
      $ISAUR -S sddm-git 2>&1 | tee -a "$LOG"
    fi
  fi

  # Install SDDM and Catppuccin theme
  printf "${NOTE} Installing SDDM-git........\n"
  for package in sddm-git; do
    install_package "$package" 2>&1 | tee -a "$LOG"
    [ $? -ne 0 ] && { echo -e "\e[1A\e[K${ERROR} - $package install has failed, please check the install.log"; exit 1; }
  done 

  # Check if other login managers installed and disabling its service before enabling sddm
  for login_manager in lightdm gdm lxdm lxdm-gtk3; do
    if pacman -Qs "$login_manager" > /dev/null; then
      echo "disabling $login_manager..."
      sudo systemctl disable "$login_manager.service" 2>&1 | tee -a "$LOG"
    fi
  done

  printf " Activating sddm service........\n"
  sudo systemctl enable sddm

  # Set up SDDM
  echo -e "${NOTE} Setting up the login screen."
  sddm_conf_dir=/etc/sddm.conf.d
  [ ! -d "$sddm_conf_dir" ] && { printf "$CAT - $sddm_conf_dir not found, creating...\n"; sudo mkdir "$sddm_conf_dir" 2>&1 | tee -a "$LOG"; }

  wayland_sessions_dir=/usr/share/wayland-sessions
  [ ! -d "$wayland_sessions_dir" ] && { printf "$CAT - $wayland_sessions_dir not found, creating...\n"; sudo mkdir "$wayland_sessions_dir" 2>&1 | tee -a "$LOG"; }
  sudo cp assets/hyprland.desktop "$wayland_sessions_dir/" 2>&1 | tee -a "$LOG"
    
  # SDDM-CATPPUCIN theme
  read -n1 -rep "${CAT} OPTIONAL - Would you like to install SDDM themes? (y/n)" install_sddm_catppuccin
  if [[ $install_sddm_catppuccin =~ ^[Yy]$ ]]; then
    while true; do
      read -rp "${CAT} Which SDDM Theme you want to install? Catpuccin or Tokyo Night 'c' or 't': " choice 
      case "$choice" in
        c|C)
          printf "\n%s - Installing Catpuccin SDDM Theme\n" "${NOTE}"
          for sddm_theme in sddm-catppuccin-git; do
            install_package "$sddm_theme" 2>&1 | tee -a "$LOG"
            [ $? -ne 0 ] && { echo -e "\e[1A\e[K${ERROR} - $sddm_theme install has failed, please check the install.log"; }
          done
          echo -e "[Theme]\nCurrent=catppuccin" | sudo tee -a "$sddm_conf_dir/10-theme.conf" 2>&1 | tee -a "$LOG"                		
          break
          ;;
        t|T)
          printf "\n%s - Installing Tokyo SDDM Theme\n" "${NOTE}"
          for sddm_theme in sddm-theme-tokyo-night; do
            install_package "$sddm_theme" 2>&1 | tee -a "$LOG"
            [ $? -ne 0 ] && { echo -e "\e[1A\e[K${ERROR} - $sddm_theme install has failed, please check the install.log"; }
          done	
          echo -e "[Theme]\nCurrent=tokyo-night-sddm" | sudo tee -a "$sddm_conf_dir/10-theme.conf" 2>&1 | tee -a "$LOG"                		
          break
          ;;                		
        *)
          printf "%s - Invalid choice. Please enter 'c' or 't'\n" "${ERROR}"
          continue
          ;;
      esac
    done
  fi
else
  printf "${NOTE} SDDM will not be installed.\n"
fi
 
# Clear screen
clear


#clear screen
clear

# XDPH
printf "${YELLOW} Kindly note XDPH only needed for screencast/screenshot. Hyprland will still work hence this is optional\n"
printf "\n"
read -n1 -rep "${CAT} Would you like to install XDG-Portal-Hyprland? (y/n)" XDPH
if [[ $XDPH =~ ^[Yy]$ ]]; then
  printf "${NOTE} Installing XDPH...\n"
  for xdph in xdg-desktop-portal-hyprland; do
    install_package "$xdph" 2>&1 | tee -a "$LOG"
        if [ $? -ne 0 ]; then
        echo -e "\e[1A\e[K${ERROR} - $xdph install had failed, please check the install.log"
        exit 1
        fi
    done
else
  printf "${NOTE} XDPH will not be installed..\n"
fi

#clear screen
clear

### Disable wifi powersave mode ###
read -n1 -rp "${CAT} Would you like to disable wifi powersave? (y/n) " WIFI
if [[ $WIFI =~ ^[Yy]$ ]]; then
	LOC="/etc/NetworkManager/conf.d/wifi-powersave.conf"
  if [ -f "$LOC" ]; then
  printf "${OK} seems wifi powersave already disabled.\n"
  else
  printf "\n"
  printf "${NOTE} The following has been added to $LOC.\n"
  printf "[connection]\nwifi.powersave = 2" | sudo tee -a $LOC
  printf "\n"
  printf "${NOTE} Restarting NetworkManager service...\n"
  sudo systemctl restart NetworkManager 2>&1 | tee -a "$LOG"
  sleep 2        
  fi    
else
  printf "${NOTE} WIFI Powersave is not being disabled.\n"
fi

#clear screen
clear

# Function to detect keyboard layout in a tty environment
detect_tty_layout() {
  layout=$(localectl status --no-pager | awk '/X11 Layout/ {print $3}')
  if [ -n "$layout" ]; then
    echo "$layout"
  else
    echo "unknown"
  fi
}

# preparing hyprland.conf keyboard layout
# Function to detect keyboard layout in an X server environment
detect_x_layout() {
  layout=$(setxkbmap -query | grep layout | awk '{print $2}')
  if [ -n "$layout" ]; then
    echo "$layout"
  else
    echo "unknown"
  fi
}

# Detect the current keyboard layout based on the environment
if [ -n "$DISPLAY" ]; then
  # System is in an X server environment
  layout=$(detect_x_layout)
else
  # System is in a tty environment
  layout=$(detect_tty_layout)
fi

echo "Keyboard layout: $layout"

printf "${NOTE} Detecting keyboard layout to prepare necessary changes in hyprland.conf before copying\n"
printf "\n"
printf "\n"

# Prompt the user to confirm whether the detected layout is correct
read -p "Detected keyboard layout or keymap: $layout. Is this correct? [y/n] " confirm

if [ "$confirm" = "y" ]; then
  # If the detected layout is correct, update the 'kb_layout=' line in the file
  awk -v layout="$layout" '/kb_layout/ {$0 = "  kb_layout=" layout} 1' config/hypr/configs/Settings.conf > temp.conf
  mv temp.conf config/hypr/configs/Settings.conf
else
  # If the detected layout is not correct, prompt the user to enter the correct layout
  printf "${WARN} Ensure to type in the proper keyboard layout, e.g., gb, de, pl, etc.\n"
  read -p "Please enter the correct keyboard layout: " new_layout
  # Update the 'kb_layout=' line with the correct layout in the file
  awk -v new_layout="$new_layout" '/kb_layout/ {$0 = "  kb_layout=" new_layout} 1' config/hypr/configs/Settings.conf > temp.conf
  mv temp.conf config/hypr/configs/Settings.conf
fi
printf "\n"
printf "\n"


# zsh and oh-my-zsh
printf "${WARN} #### IF YOU HAVE ALREADY ZSH AND OH MY ZSH, YOU SHOULD CHOOSE NO HERE #########\n"
printf "${WARN} ### --------------------------------------------------------------------########\n"
printf "${NOTE} ## CHECK OUT README FOR ADDITIONAL STEPS REQUIRED ONCE ZSH AND OH-MY-ZSH INSTALLED ##\n"
printf "\n"
printf "\n"
read -n1 -rep "${CAT} OPTIONAL - Would you like to install zsh and oh-my-zsh and use as default shell? (y/n)" zsh
echo

if [[ $zsh =~ ^[Yy]$ ]]; then
  for ZSH in zsh zsh-completions; do
    install_package "$ZSH" 2>&1 | tee -a "$LOG"
    if [ $? -ne 0 ]; then
      echo -e "\e[1A\e[K${ERROR} - $ZSH install had failed, please check the install.log"
    fi
  done

  # Oh-my-zsh plus zsh-autosuggestions and zsh-syntax-highlighting
  printf "${NOTE} Installing oh-my-zsh and plugins.\n"
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
  cp -r 'assets/.zshrc' ~/
  print_success "ZSH and oh-my-zsh installed."
else
  printf "${NOTE} ZSH wont be installed.\n"
fi

#clear screen
clear

### Copy Config Files ###
set -e # Exit immediately if a command exits with a non-zero status.

read -n1 -rep "${CAT} Would you like to copy config and wallpaper files? (y,n)" CFG
if [[ $CFG =~ ^[Yy]$ ]]; then
  # Check for existing config folders and backup
  for DIR in cava hypr swappy swaylock waybar wlogout wofi; do 
    DIRPATH=~/.config/$DIR
    if [ -d "$DIRPATH" ]; then 
      echo -e "${NOTE} - Config for $DIR found, attempting to back up."
      mv $DIRPATH $DIRPATH-back-up 2>&1 | tee -a "$LOG"
      echo -e "${NOTE} - Backed up $DIR to $DIRPATH-back-up."
    fi
  done

  for DIRw in wallpapers; do 
    DIRPATH=~/Pictures/$DIRw
    if [ -d "$DIRPATH" ]; then 
      echo -e "${NOTE} - wallpapers in $DIRw found, attempting to back up."
      mv $DIRPATH $DIRPATH-back-up 2>&1 | tee -a "$LOG"
      echo -e "${NOTE} - Backed up $DIRw to $DIRPATH-back-up."
    fi
  done

  #
  # Copying config files............................
  #
  printf " Copying config files...\n"
  mkdir -p ~/.config
  cp -r config/* ~/.config/ && { echo "Config File Copy completed!"; } || { echo "Error: Failed to copy config files."; exit 1; } 2>&1 | tee -a "$LOG"
  
  mkdir -p ~/Pictures/wallpapers
  cp -r wallpapers ~/Pictures/ && { echo "Copy completed!"; } || { echo "Error: Failed to copy wallpapers."; exit 1; } 2>&1 | tee -a "$LOG"

  # Set some files as executable.......................
  chmod +x ~/.config/hypr/scripts/* 2>&1 | tee -a "$LOG"
  chmod +x ~/.config/waybar/scripts/* 2>&1 | tee -a "$LOG"
else
  print_error " No Config files and wallpaper files copied"
fi

# Clear screen
clear

### Script is done ###
printf "\n${OK} Yey! Installation Completed.\n"
printf "\n"
printf "\n"
printf "\n${NOTE} NOTICE TO NVIDIA OWNERS! REBOOT YOUR SYSTEM!!! else you will have issues"
printf "\n"
printf "\n"
sleep 2
printf "\n${NOTE} You can start Hyprland by typing Hyprland (IF SDDM is not installed) (note the capital H!).\n"
printf "\n"
printf "\n"
printf "\n"
read -n1 -rep "${CAT} Would you like to start Hyprland now? (y,n)" HYP

if [[ $HYP =~ ^[Yy]$ ]]; then
  if command -v sddm >/dev/null; then
   sudo systemctl start sddm 2>&1 | tee -a "$LOG"
  fi

  if command -v Hyprland >/dev/null; then
    exec Hyprland
  else
    print_error "Hyprland not found. Please make sure Hyprland is installed by checking install.log.\n"
    exit 1
  fi
else
    exit
fi

