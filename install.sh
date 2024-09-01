#!/bin/bash

echo "Welcone to the bspwm-dotfiles install script! by unixkiwi"
echo ""
echo -e "Note: These dotfiles are made for my system and it is very likely that they will not work for your system!\nSpecific things are:\n - the workspaces for two monitors(eDP-1 and DP-1) with the specific script\n - the sizes of the menus in static pixel which are good for me with 1920x1080"
echo ""
echo "Do you wish to install the bspwm dotfiles? (y/n)"

choice_read () {
	read choice
	if [ $choice = "y" ]; then
		echo "OK, the script will now install the needed packages."
		echo ""
	elif [ $choice = "Y" ]; then
		echo "OK, the script will now install the needed packages."
		echo ""
	elif [ $choice = "n" ]; then
		echo "OK, the script will now exit!"
		sleep 2
		exit
	elif [ $choice = "N" ]; then
		echo "OK, the script will now exit!"
		sleep 2
		exit
	else
		echo "Invalid choice please enter your choice again. (y/Y or n/N):"
		choice_read
	fi
}

choice_read

# Install needed packages
sudo apt install git wget curl nano bspwm sxhkd nitrogen blueman \
	pulseaudio polybar picom nala dunst lxpolkit xorg exa doublecmd-gtk \
	rofi nwg-look neofetch gpg alacritty lightdm fonts-font-awesome \
	python3 

echo "Do you want to install some general useful packages like file-explorer, libre-office? (y/Y or n/N)" 
extra_pckgs_choice () {
read std_pckgs
if [ $std_pckgs = "y" || $std_pckgs = "Y" ]; then
	echo "Do you want to list the packages, which are going to be installed? (y/Y or n/N)"
	read list_pckgs
	if [ $list_pckgs = "y" || $list_pckgs = "Y" ]; then
		echo "
- Firefox (addding repo from mozilla cause it's not in the standard)
- DoubleCMD (gtk version)
- nwg-look (GTK configuration app)
- Libre-Office (Office App)
- gnome-calculator (Calculator)
- btop (System Monitoring tool)
- VLC (i think you know about it, it's that well known media player)
- GParted (disk managment)
- Kitty (extra terminal if alacritty breaks)
- Cmatrix (look like a hacker)
- KeePassXC (keep your passwords safe)
- Eye of Gnome (image viewer)
"
	elif [ $list_pckgs = "n" || $list_pckgs = "N" ]; then
		echo "OK, the install will not install extra packages."
	else
		echo "Invalid choice reenter your choice! (y/Y or n/N)"
		extra_pckgs_choice
	fi
}

extra_pckgs_choice