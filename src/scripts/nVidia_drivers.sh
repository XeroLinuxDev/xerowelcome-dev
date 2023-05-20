#!/bin/bash
#set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	DarkXero
# Website 	: 	http://xerolinux.xyz
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
echo "#      Choose Option 2 for Vanilla Drivers, Maintained by Upstream Arch.      #"
echo "#   Options 3/4 Will install latest or 470xx TKG ones Optimized for Gaming.   #"
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
echo "2.  Latest Vanilla Drivers (GTX 900 Seies & Newer incl. 745/750ti)."
echo "3.  Latest TKG Optimized Drivers (GTX 900 Seies & Newer incl. 745/750ti)."
echo "4.  R470.x Legacy TKG Optimized Drivers (GTX 600 & 700 Series excl. 605/610/620/625/645)."
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

    3 )
      echo
      echo "##################################################"
      echo "   Installing Latest Vanilla nVidia GPU Drivers   "
      echo "##################################################"
      sleep 3
      sudo pacman -S --noconfirm --needed nvidia-dkms nvidia-settings nvidia-utils lib32-nvidia-utils egl-wayland lib32-libxnvctrl libxnvctrl opencl-nvidia lib32-opencl-nvidia dxvk-nvapi-mingw vulkan-icd-loader lib32-vulkan-icd-loader lib32-nvidia-libgl dxvk-bin
      sleep 3
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    3 )
      echo
      echo "##############################################"
      echo "   Installing Latest TKG nVidia GPU Drivers   "
      echo "##############################################"
			sleep 3
			sudo pacman -S --noconfirm --needed nvidia-dkms-tkg nvidia-utils-tkg nvidia-settings-tkg nvidia-egl-wayland-tkg opencl-nvidia-tkg libxnvctrl lib32-libxnvctrl lib32-nvidia-utils-tkg lib32-opencl-nvidia-tkg dxvk-nvapi-mingw vulkan-icd-loader lib32-vulkan-icd-loader lib32-nvidia-libgl dxvk-bin
			sleep 3
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    4 )
      echo
      echo "##############################################"
      echo "   Installing nVidia R470.x TKG GPU Drivers   "
      echo "##############################################"
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
