#!/bin/bash

echo "Welcone to the bspwm-dotfiles install script! by unixkiwi"
echo ""
echo "Did you changed you apt sources to testing? If not do so!"
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
	pulseaudio polybar picom nala dunst lxpolkit xorg doublecmd-gtk \
	rofi nwg-look neofetch gpg alacritty lightdm fonts-font-awesome \
	python3 pavucontrol bluez eza less network-manager libnotify-bin psmisc

echo "Do you want to install some general useful packages like file-explorer, libre-office? (y/Y or n/N)" 
extra_pckgs_choice () {
	read std_pckgs
	if [ $std_pckgs = "y" || $std_pckgs = "Y" ]; then
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

	sudo apt update
	sudo nala install firefox vlc btop eog gnome-calculator keepassxc cmatrix kitty gparted libreoffice doublecmd-gtk nwg-look
	
	elif [ $std_pckgs = "n" || $std_pckgs = "N" ]; then
		echo "OK, the install will not install extra packages."
	else
		echo "Invalid choice reenter your choice! (y/Y or n/N)"
		extra_pckgs_choice
	fi
}

extra_pckgs_choice

echo "Should your config files get linked to a folder called bspwm-dotfiles? (y/Y or n/N)"

dotfiles_link() {
  read link_files
  if [ $choice = "Y" ] || [ $link_files = "y" ]; then
    echo "OK, the script will link the config files."
    cd ~/.config/
    rm -r bspwm dunst polybar sxhkd rofi
    rm picom.conf
    rm ~/.xsessionrc
    echo "source .bash_aliases" >> ~/.bashrc

    ln -s $HOME/bspwm-dotfiles/.config/bspwm $HOME/.config/bspwm
    ln -s $HOME/bspwm-dotfiles/.config/dunst $HOME/.config/dunst
    ln -s $HOME/bspwm-dotfiles/.config/polybar $HOME/.config/polybar
    ln -s $HOME/bspwm-dotfiles/.config/rofi $HOME/.config/rofi
    ln -s $HOME/bspwm-dotfiles/.config/sxhkd $HOME/.config/sxhkd
    ln -s $HOME/bspwm-dotfiles/.config/picom.conf $HOME/.config/picom.conf
    ln -s $HOME/bspwm-dotfiles/.bash_aliases $HOME/.bash_aliases
    ln -s $HOME/bspwm-dotfiles/.scripts $HOME/.scripts

    echo "Set perms for .scripts files"
    echo "chmod +x power_menu switch_workspace volume_indi"

  elif [ $link_files = "N" ] || [ $link_files = "n" ]; then
    echo "OK, the script will not link the files!"
    echo "source .bash_aliases" >> ~/.bashrc

    echo "cp $HOME/bspwm-dotfiles/.config/bspwm $HOME/.config/bspwm"
    cp $HOME/bspwm-dotfiles/.config/dunst $HOME/.config/dunst
    cp $HOME/bspwm-dotfiles/.config/polybar $HOME/.config/polybar
    cp $HOME/bspwm-dotfiles/.config/rofi $HOME/.config/rofi
    cp $HOME/bspwm-dotfiles/.config/sxhkd $HOME/.config/sxhkd
    cp $HOME/bspwm-dotfiles/.config/picom.conf $HOME/.config/picom.conf
    cp $HOME/bspwm-dotfiles/.bash_aliases $HOME/.bash_aliases
    cp $HOME/bspwm-dotfiles/.scripts $HOME/.scripts

    echo "Set perms for .scripts files"
    chmod +x power_menu switch_workspace volume_indi
	
  else
    echo "Invalid choice please enter your choice again. (y/Y)"
    dotfiles_link
  fi
}

dotfiles_link

echo -e "\n\n"
echo "IT'S DONE YOU JUST INSTALLED MY DOTFILES!!! I THANK YOU VERY MUCH FOR THAT!!!"
echo -e "\n\nThe script will now quit in 2 seconds."
sleep 2