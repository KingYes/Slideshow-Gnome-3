#!/bin/bash
# Copyright (C) Yakir Sitbon 2011 <kingyes1@gmail.com>
# 
# slideshow-gnome-3 is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# slideshow-gnome-3 is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along
# with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Install:
# --------
# 1) Edit the head var on the file (really simple).
# 2) Add exec access -> $ chmod +x slideshow-gnome-3.sh
# 3) Just run 'gnome-session-properties' and add the bash file on the list.
# 4) Enjoy !
#
# AUTHOR: Yakir Sitbon.
# VARSION: v0.1.
# LICENSE: GPL.
# Date: 10/07/2011.
#
# TODO: Add GUI for simple setting.
# TODO: Add checker system.
#

# The base folder for random images.
image_folder="/mnt/d/Wallpapers/"

# Set int number for wait by seconds.
timeout="900"

# Start non-stop loop.
while true; do
	# Change the folder for $PWD var.
	cd $image_folder

	# Get the random image.
	imageName=$(find $PWD -regex ".*\(jpg\|png\|gif\|jpeg\)$" -type f | while read x; do echo "`expr $RANDOM % 1000`:$x"; done | sort -n| sed 's/[0-9]*://' | head -1)

	# Add string for uri link.
	image_link="file://"$imageName
	
	# Change the wallpaper.	
	gsettings set org.gnome.desktop.background picture-uri "$image_link"
	
	# Debug line (Optical).
	#echo $image_link
	
	# Wating by timeout.
	sleep $timeout
done

