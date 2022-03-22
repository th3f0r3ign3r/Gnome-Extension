#!/bin/bash

if [[ $# != 1 ]]; then
	echo "$0 need at lest 1 argument [Zip file of extension]"
else
	mkdir ~/.local/share/gnome-shell/extensions/newext
	unzip -q $1 -d ~/.local/share/gnome-shell/extensions/newext
	uuid=$(cat ~/.local/share/gnome-shell/extensions/newext/metadata.json | grep uuid | cut -d\" -f4)
	mv ~/.local/share/gnome-shell/extensions/newext ~/.local/share/gnome-shell/extensions/$uuid

	echo "Make sure to save all your work if your answer for the following quiz is yes/Yes"
	read -r -p "Restart the shell ? (Y/N): " ans

	if [[ $ans == "Y" || $ans == "y" ]]; then
		echo "Restarting the shell"
		sleep 5
		killall -3 gnome-shell
	else
		echo "Gnome extension installed"
	fi
fi