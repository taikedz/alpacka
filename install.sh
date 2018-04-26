#!/bin/bash

set -euo pipefail

[[ $UID -gt 0 ]] && {
	echo "You are not root"
	exit 1
}

cd "$(dirname "$0")"

if [[ "$*" =~ xkcd ]]; then
	bash bin/pafx --help
	read -p "Are you sure you want to install the XKCD installer? y/N> "
	[[ $REPLY =~ ^(y|Y|yes|YES)$ ]] && {
		cp bin/pafx /usr/local/bin/pafx
		echo "The 'pafx' command is now available. You masochist."
	}
	exit
else
	cp bin/pafs bin/paf /usr/local/bin/

	echo "The 'paf' and 'pafs' commands are now available."
fi
