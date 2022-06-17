#!/bin/bash

rpi2desktop()
{
	ssh rpi "transmission-remote -t all -r && sudo chown -R pi:pi ~/torrent/completed/* && mv ~/torrent/completed/* ~/ftp/"
	# Hoping for faster rsync by using this gist: https://gist.github.com/KartikTalwar/4393116
	# rsync -ah --remove-source-files --progress pi@rpi.local:ftp/ ~/Desktop/
	rsync -aHAXxv --numeric-ids --remove-source-files --progress -e "ssh -T -c arcfour -o Compression=no -x" pi@rpi.local:ftp/ ~/Desktop/
}

torrestart()
{
	sudo systemctl restart tor.service
	journalctl -fu tor.service
}

function brightness()
{
	if [ $# -eq 0 ]; then
		cat /sys/class/backlight/intel_backlight/brightness
	elif [ "$1" = "max" ]; then
		cat /sys/class/backlight/intel_backlight/max_brightness | sudo tee /sys/class/backlight/intel_backlight/brightness
	else
		echo "$1" | sudo tee /sys/class/backlight/intel_backlight/brightness
	fi
}

transfer()
{
	if [ $# -eq 0 ]; then
		echo "No arguments specified. Usage: echo transfer <filename>"
		return 1
	fi
	curl --progress-bar -T $1 https://filepush.co/upload/
	echo
}

fa()
{
	if [ $# -eq 0 ]; then
		echo "No arguments specified. Usage: fa sum.srt [movie.mkv]"
		return 1
	fi
	local tmpfile=$( mktemp -t faXXX );
	if [ $# -eq 1 ]; then
		local destfile="$(dirname "$1")/$(basename "$1")"
	else
		local destfile="$(dirname "$2")/$(basename "$2")"
	fi
	destfile="${destfile%.*}.srt"
	iconv -f WINDOWS-1256 -t UTF8 "$1" | sed s/ي/ی/g | sed s/ك/ک/g > "$tmpfile"
	mv -f "$tmpfile" "$destfile"
}

alias fullup="sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y" 
