#!/bin/bash

rpi2desktop()
{
	ssh rpi "transmission-remote -t all -r && sudo chown -R pi:pi ~/torrent/completed/* && mv ~/torrent/completed/* ~/ftp/"
	rsync -ah --remove-source-files --progress pi@rpi.local:ftp/ ~/Desktop/
}

torrestart()
{
	sudo service tor restart
	tail -f /var/log/tor/log
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
		echo "No arguments specified. Usage: echo transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
		return 1
	fi
	local tmpfile=$( mktemp -t transferXXX );
	if tty -s; then
		local basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
		curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile
	else
		curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile
	fi
	cat $tmpfile
	rm -f $tmpfile
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

tunnel()
{
	local sshcmd="ssh -f -N -n -D localhost:8090 vps"
	# local sshcmd="ssh -f -N -n -D localhost:8090 -R 12345:localhost:12345 vps"
	# kill -9 `ps ax | grep $sshcmd | cut -d' ' -f 1 | head -n -1` > /dev/null
	pkill $sshcmd
	eval $sshcmd
}
