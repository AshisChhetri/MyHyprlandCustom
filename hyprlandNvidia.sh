#!/bin/bash

# Hyprland Main installation part including automatic detection of Nvidia-GPU is present in your system
if ! lspci -k | grep -A 2 -E "(VGA|3D)" | grep -iq nvidia; then
  printf "${YELLOW} No NVIDIA GPU detected in your system. Installing Hyprland without Nvidia support..."
  sleep 1
  for HYP in hyprland; do
    install_package "$HYP" 2>&1 | tee -a $LOG
  done
else
  # Prompt user for Nvidia installation
  printf "${YELLOW} NVIDIA GPU Detected. TAKE NOTE that nvidia-wayland still a hit and miss. Any hyprland issues to be reported in Hyprland-github!\n"
  sleep 1
  printf "${YELLOW} Kindly enable some Nvidia-related stuff in the ~/.config/hypr/configs/ENVariables.conf after installation. Consult Hyprland-nvidia wiki!\n"
  sleep 2
  read -n1 -rp "${CAT} Would you like to install Nvidia Hyprland? (y/n) " NVIDIA
  echo

  if [[ $NVIDIA =~ ^[Yy]$ ]]; then
    # Install Nvidia Hyprland
    printf "\n"
    printf "${YELLOW}Installing Nvidia Hyprland...${RESET}\n"
    if pacman -Qs hyprland > /dev/null; then
      read -n1 -rp "${CAT} Hyprland detected. Would you like to remove and install hyprland-nvidia instead? (y/n) " nvidia_hypr
      echo
      if [[ $nvidia_hypr =~ ^[Yy]$ ]]; then
        sudo pacman -R --noconfirm hyprland 2>/dev/null | tee -a "$LOG" || true
      fi
    fi
    for hyprnvi in hyprland hyprland-nvidia hyprland-nvidia-hidpi-git; do
      sudo pacman -R --noconfirm "$hyprnvi" 2>/dev/null | tee -a $LOG || true
    done
    install_package "hyprland-nvidia-git" 2>&1 | tee -a $LOG
  else
    printf "\n"
    printf "${YELLOW} Installing non-Nvidia Hyprland...\n"
    for hyprnvi in hyprland-nvidia-git hyprland-nvidia hyprland-nvidia-hidpi-git; do
      sudo pacman -R --noconfirm "$hyprnvi" 2>/dev/null | tee -a $LOG || true
    done
    for HYP2 in hyprland; do
      install_package "$HYP2" 2>&1 | tee -a $LOG
    done
  fi

  # Install additional nvidia packages
  # printf "\n"
  # printf "\n"
  # printf "\n${NOTE} Kindly take note nvidia-dkms support from GTX 900 series and newer. If you have nvidia drivers already installed, it may be wise to choose 'n' here\n"
  # read -n1 -rp "${CAT} Would you like to install nvidia-dkms driver, nvidia-settings and nvidia-utils? and all other nvidia-stuff (y/n) " nvidia_driver
  # echo
  # if [[ $nvidia_driver =~ ^[Yy]$ ]]; then
  #   printf "${YELLOW} Installing Nvidia packages...\n"
  #   for krnl in $(cat /usr/lib/modules/*/pkgbase); do
  #     for NVIDIA in "${krnl}-headers" nvidia-dkms nvidia-settings nvidia-utils libva libva-nvidia-driver-git; do
  #       install_package "$NVIDIA" 2>&1 | tee -a $LOG
  #     done
  #   done
  # else
  #   printf "${NOTE} You choose not to install Nvidia stuff!\n"
  # fi

  # Check if the nvidia modules are already added in mkinitcpio.conf and add if not
  # if grep -qE '^MODULES=.*nvidia. *nvidia_modeset.*nvidia_uvm.*nvidia_drm' /etc/mkinitcpio.conf; then
  #   echo "Nvidia modules already included in /etc/mkinitcpio.conf" 2>&1 | tee -a $LOG
  # else
  #   sudo sed -Ei 's/^(MODULES=\([^\)]*)\)/\1 nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf 2>&1 | tee -a $LOG
  #   echo "Nvidia modules added in /etc/mkinitcpio.conf"
  # fi
  # sudo mkinitcpio -P 2>&1 | tee -a $LOG
  # printf "\n"
  # printf "\n"
  # printf "\n"

  # Preparing exec.conf to enable env = WLR_NO_HARDWARE_CURSORS,1 so it will be ready once config files copied
  sed -i '21s/#//' config/hypr/configs/ENVariables.conf

  # Additional Nvidia steps
  # NVEA="/etc/modprobe.d/nvidia.conf"
  # if [ -f "$NVEA" ]; then
  #   printf "${OK} Seems like nvidia-drm modeset=1 is already added in your system..moving on.\n"
  #   printf "\n"
  # else
  #   printf "\n"
  #   printf "${YELLOW} Adding options to $NVEA..."
  #   sudo echo -e "options nvidia-drm modeset=1" | sudo tee -a /etc/modprobe.d/nvidia.conf 2>&1 | tee -a $LOG
  #   printf "\n"
  # fi

  # Blacklist nouveau
  # read -n1 -rep "${CAT} Would you like to blacklist nouveau? (y/n)" response
  # echo
  # if [[ $response =~ ^[Yy]$ ]]; then
  #   NOUVEAU="/etc/modprobe.d/nouveau.conf"
  #   if [ -f "$NOUVEAU" ]; then
  #     printf "${OK} Seems like nouveau is already blacklisted..moving on.\n"
  #   else
  #     printf "\n"
  #     echo "blacklist nouveau" | sudo tee -a "$NOUVEAU" 2>&1 | tee -a $LOG
  #     printf "${NOTE} has been added to $NOUVEAU.\n"
  #     printf "\n"

  #     # To completely blacklist nouveau (See wiki.archlinux.org/title/Kernel_module#Blacklisting 6.1)
  #     if [ -f "/etc/modprobe.d/blacklist.conf" ]; then
  #       echo "install nouveau /bin/true" | sudo tee -a "/etc/modprobe.d/blacklist.conf" 2>&1 | tee -a $LOG
  #     else
  #       echo "install nouveau /bin/true" | sudo tee "/etc/modprobe.d/blacklist.conf" 2>&1 | tee -a $LOG
  #     fi
  #   fi
  # else
  #   printf "${NOTE} Skipping nouveau blacklisting.\n"
  # fi
fi