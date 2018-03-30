#!/bin/bash

[[ $UID -gt 0 ]] && {
	echo "You are not root"
	exit 1
}

cd "$(dirname "$0")" || {
	echo "Please switch to the alpacka directory"
	exit 1
}

if [[ "$@" =~ xkcd ]]; then
	bash bin/pafx --help
	read -p "Are you sure?  y/N> "
	[[ $REPLY = 'y' ]] && {
		cp bin/pafx /usr/local/bin/pafx
		echo "The 'pafx' command is now available. You masochist."
	}
	exit
fi

cp bin/pafs bin/paf /usr/local/bin/

echo "The 'paf' and 'pafs' commands are now available."
