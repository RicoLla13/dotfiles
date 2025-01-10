#!/bin/bash

username="liviuand.arsenesc" # Changer
mount_point="/home/liviu/dev/disk_hearc"

# Array of subdirectories to be created under mount_point
directories=("formation" "home" "share")

# Loop through each directory and create it if it doesn't exist
for dir in "${directories[@]}"; do
  if [ ! -d "$mount_point/$dir" ]; then
    echo "Directory $mount_point/$dir does not exist. Creating it..."
    mkdir -p "$mount_point/$dir"
  else
    echo "Directory $mount_point/$dir already exists."
  fi
done

# Mount the directories
sudo mount -t cifs //intra.he-arc.ch/ORG/ING/Formation $mount_point/formation -o username=$username
sudo mount -t cifs //intra.he-arc.ch/UTL/ING-ETU/$username $mount_point/home -o username=$username
sudo mount -t cifs //intra.he-arc.ch/ORG/HE-ARC/ $mount_point/share -o username=$username
