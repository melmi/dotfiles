rpi2desktop()
{
	mkdir -p /home/mohammad/rpiftp 
	sudo curlftpfs -o allow_other ftp://rpi.local /home/mohammad/rpiftp/
	rsync -ah --progress /home/mohammad/rpiftp/* /home/mohammad/Desktop/
	rm -r /home/mohammad/rpiftp/*
	sudo umount /home/mohammad/rpiftp/
	rm -r /home/mohammad/rpiftp
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
		echo "No arguments specified."
	       	return 1
       	fi 
	echo "$@" | sudo tee /sys/class/backlight/intel_backlight/brightness
}
alias brightness=brightness

transfer() 
{ 
	if [ $# -eq 0 ]; then 
		echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
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
