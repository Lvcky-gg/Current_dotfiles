#!/bin/bash
clear
echo " ____           _                 _  "
echo "|  _ \ _ __ ___| | ___   __ _  __| | "
echo "| |_) | '__/ _ \ |/ _ \ / _' |/ _' | "
echo "|  __/| | |  __/ | (_) | (_| | (_| | "
echo "|_|   |_|  \___|_|\___/ \__,_|\__,_| "
echo "                                      "
echo ""

# -----------------------------------------------------
# Confirm Start
# -----------------------------------------------------
while true; do
    read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# -----------------------------------------------------
# Install zram
# -----------------------------------------------------
yay --noconfirm -S preload

echo "DONE!"
