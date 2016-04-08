#!/bin/bash

rpi2desktop()
{
	mkdir -p /home/mohammad/rpiftp 
	sudo curlftpfs -o allow_other ftp://rpi.local /home/mohammad/rpiftp/
	rsync -ah --progress /home/mohammad/rpiftp/* /home/mohammad/Desktop/
	rm -rf /home/mohammad/rpiftp/*
	sudo umount /home/mohammad/rpiftp/
	rm -rf /home/mohammad/rpiftp
}
alias rpi2desktop=rpi2desktop

torrestart()
{
	sudo service tor restart
	tail -f /var/log/tor/log
}
alias torrestart=torrestart

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
alias brightness=brightness

transfer() 
{ 
	if [ $# -eq 0 ]; then 
		echo "No arguments specified. Usage: echo transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
		return 1
	fi 
	tmpfile=$( mktemp -t transferXXX ); 
	if tty -s; then 
		basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
		curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile
	else 
		curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile
	fi
	cat $tmpfile
	rm -f $tmpfile
}
alias transfer=transfer 

fa() 
{ 
	if [ $# -eq 0 ]; then 
		echo "No arguments specified. Usage: fa sum.srt [movie.mkv]"
		return 1
	fi 
	tmpfile=$( mktemp -t faXXX ); 
	if [ $# -eq 1 ]; then
		destfile="$(dirname "$1")/$(basename "$1")"
	else
		destfile="$(dirname "$2")/$(basename "$2")"
	fi		
	destfile="${destfile%.*}.srt"
	iconv -f WINDOWS-1256 -t UTF8 "$1" | sed s/ي/ی/g | sed s/ك/ک/g > "$tmpfile"
	mv -f "$tmpfile" "$destfile"
}

alias tunnel="ssh -ND 9999 vps &"

alias vpn="sudo openvpn --config /home/mohammad/Desktop/melmi.ovpn"
