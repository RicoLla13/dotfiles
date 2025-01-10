#!/bin/bash

# Credentials variables
userName="Liviu Arsenescu"
mailPers="liviuarsenescu@gmail.com"
mailHeArc="liviu-andrei.arsenescu@he-arc.ch"

while [[ $sel -eq "0" ]]; do
	echo "Git Credentials Selection Script"
	echo "Options:"
	echo "[1] pesonal Github"
	echo "[2] HeArc GitLab"
	echo "[q] Quit"

	read -p "Selection: " sel

	if [[ sel -eq "1" ]]; then
		mailSel=$mailPers
	elif [[ sel -eq "2" ]]; then
		mailSel=$mailHeArc
	elif [[ sel -eq "q" ]]; then
		exit
	else
		sel="0"
	fi
done

git config --global user.name $userName
git config --global user.email $mailSel
