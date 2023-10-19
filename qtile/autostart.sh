#!/bin/sh
#   ___ _____ ___ _     _____   ____  _             _    
#  / _ \_   _|_ _| |   | ____| / ___|| |_ __ _ _ __| |_  
# | | | || |  | || |   |  _|   \___ \| __/ _` | '__| __| 
# | |_| || |  | || |___| |___   ___) | || (_| | |  | |_  
#  \__\_\|_| |___|_____|_____| |____/ \__\__,_|_|   \__| 
#                                                        
#  
# ----------------------------------------------------- 

# My screen resolution
xrandr --rate 120

# For Virtual Machine 
# xrandr --outout Virtual-1 --mode 1920x1080

# Set keyboard mapping
setxkbmap de
# setxkbmap en

# Load picom
picom &

# Load power manager
xfce4-power-manager &

# Load notification service
dunst &

# Launch polybar
~/dotfiles/polybar/launch.sh &

# Setup Wallpaper and update colors
~/dotfiles/scripts/updatewal.sh &

# Load Windows 11 VM
# virsh --connect qemu:///system start win11
