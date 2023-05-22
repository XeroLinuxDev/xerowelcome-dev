#!/bin/bash
#set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author  :   DarkXero
# Website   :   http://xerolinux.xyz
##################################################################################################################
echo
tput setaf 3
echo "###############################################################################"
echo "#               XeroLinux nVidia (Proprietary) Driver Installer               #"
echo "#                                                                             #"
echo "#                             !!! ATTENTION !!!                               #"
echo "#                                                                             #"
echo "#                     Carefully Select The right Drivers..                    #"
echo "#                                                                             #"
echo "#   Latest R525.x/R530.x & R470.x Drivers are provided. For Older Check TKG   #"
echo "#           TKG Git -> https://github.com/Frogging-Family/nvidia-all          #"
echo "###############################################################################"
tput sgr0
echo
echo "Hello $USER, Please Select An Option Below."
echo
echo "##################### GPU Checker ####################"
echo
echo "1.  Check Which nVidia GPU You Have."
echo
echo "############# nVidia Proprietary Drivers #############"
echo
echo "2.  R530.x Drivers (New Features Branch)."
echo "3.  R525.x Drivers (Production Branch)."
echo "4.  R470.x Drivers (Legacy Branch)."
echo
echo "Type Your Selection. To Exit, just close Window."
echo

while :; do

read CHOICE

case $CHOICE in

    1 )
      echo
      echo "##########################################"
      echo "          Checking Installed GPU          "
      echo "##########################################"
      echo
      echo "Your system has the following GPU(s)"
      echo
      sleep 3
      lspci -x | grep VGA
      sleep 3
      echo
            glxinfo | grep -E "OpenGL vendor|OpenGL renderer*"
            sleep 6
      echo
      echo "##################################################################"
      echo "                  Opening nVidia Drivers page...                  "
      echo " Check What Version Your GPU Needs Before Installing or Building. "
      echo "##################################################################"
      sleep 6
      xdg-open https://www.nvidia.com/download/index.aspx?lang=en-us &
      sleep 1
      clear && sh /usr/share/xerowelcome/scripts/nVidia_drivers.sh
      echo
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"

      ;;

    2 )
      
      echo
      echo "####################################################"
      echo "              New Feature Branch (NFB)              "
      echo "                                                    "
      echo "  Provide early adopters access to latest features  "
      echo "     before merging to the Production Branches      "
      echo "####################################################"
      sleep 10
      echo
      echo "##########################################"
      echo "   Installing nVidia R530.x GPU Drivers   "
      echo "##########################################"
      sleep 3
      sudo pacman -S --noconfirm --needed nvidia-dkms-tkg nvidia-utils-tkg nvidia-settings-tkg nvidia-egl-wayland-tkg opencl-nvidia-tkg libxnvctrl lib32-libxnvctrl lib32-nvidia-utils-tkg lib32-opencl-nvidia-tkg dxvk-nvapi-mingw vulkan-icd-loader lib32-vulkan-icd-loader lib32-nvidia-libgl dxvk-bin
      sleep 3
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    3 )
      echo
      echo "####################################################"
      echo "               Production Branch (PB)               "
      echo "                                                    "
      echo "      Provides optimal stability & performance      "
      echo "   Receives sustained bug fix & security updates.   "
      echo "####################################################"
      sleep 10
      echo
      echo "##########################################"
      echo "   Installing nVidia R525.x GPU Drivers   "
      echo "##########################################"
      sleep 3
      sudo pacman -S --noconfirm nvidia-525xx-dkms-tkg nvidia-525xx-utils-tkg nvidia-525xx-settings-tkg nvidia-525xx-egl-wayland-tkg opencl-nvidia-525xx-tkg libxnvctrl-525xx lib32-nvidia-525xx-utils-tkg lib32-opencl-nvidia-525xx-tkg dxvk-nvapi-mingw dxvk-bin
      sleep 3
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    4 )
      echo
      echo "####################################################"
      echo "                 Legacy Branch (LB)                 "
      echo "                                                    "
      echo "       Provides Support for now Legacy GPUs         "
      echo "    Rarely receives any updates. Use at Own Risk    "
      echo "####################################################"
      sleep 10
      echo
      echo "##########################################"
      echo "   Installing nVidia R470.x GPU Drivers   "
      echo "##########################################"
      sleep 3
      sudo pacman -S --noconfirm nvidia-470xx-dkms-tkg nvidia-470xx-utils-tkg nvidia-470xx-settings-tkg opencl-nvidia-470xx-tkg libxnvctrl-470xx lib32-nvidia-470xx-utils-tkg lib32-opencl-nvidia-470xx-tkg lib32-libxnvctrl-470xx dxvk-nvapi-mingw dxvk-bin
      sleep 3
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    * )
      echo "#################################"
      echo "    Choose the correct number    "
      echo "#################################"
      ;;
esac
done