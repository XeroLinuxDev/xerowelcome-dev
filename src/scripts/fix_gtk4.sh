#!/bin/bash
#set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	DarkXero
# Website 	: 	http://xerolinux.xyz
##################################################################################################################
tput setaf 1
echo "###############################################################################"
echo "#                   !!! XeroLinux LibAdwaita Themer Tool !!!                  #"
echo "#                                                                             #"
echo "#   This will apply current theme (Catppuccin) to GTK3/GTK4/LibAdwaita Apps   #"
echo "#             Oh, it will apply it to supported Flatpaks as well              #"
echo "###############################################################################"
tput sgr0
echo
echo "Hello $USER, Are you sure you want to do this ?"
echo
echo "y.  Yep Let's do this !"
echo "n.  Nope I changed me mind."
echo
echo
echo "Please Select an Option..."
echo

read CHOICE

case $CHOICE in

    y )
      echo "Applying Default Theme to LibAdwaita "
      echo "#####################################"
      echo
      echo "Removing Any GTK Packages if present"
      sudo pacman -Rns --noconfirm catppuccin-gtk-theme-mocha-mauve &>/dev/null; sudo pacman -Rns --noconfirm catppuccin-gtk-theme-mocha &>/dev/null
      sleep 2
      echo
      # Clone GTK theme repository and install
      echo "Installing catppuccin GTK4 theme & Applying LibAdwaita Patch"
      cd ~ && git clone --recurse-submodules https://github.com/catppuccin/gtk.git && cd gtk/ && pip3 install -r requirements.txt && python install.py mocha -l -a mauve --tweaks normal -d ~/.themes && sh /usr/local/bin/stylepak install-system Catppuccin-Mocha-Standard-Mauve-Dark && rm -Rf ~/gtk/
      sleep 2
      echo
      echo "##################################"
      echo "  Done! Reboot to Apply Settings  "
      echo "##################################"
      sleep 3

      ;;

    n )
      echo
      echo "##################################"
      echo "     Ok, as you wish Sir/M'am     "
      echo "##################################"
      exit
      sleep 3

      ;;

    * )
      echo "#################################"
      echo "Choose the correct number"
      echo "#################################"
      ;;
esac
