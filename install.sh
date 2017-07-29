#!/bin/bash

cd "$(dirname "$0")"

[[ $UID -gt 0 ]] && {
	echo "You are not root"
	exit 1
}

if [[ "$@" =~ xkcd ]]; then
	bin/install.xkcd --help
	read -p "Are you sure?  y/N> "
	[[ $REPLY = 't' ]] && {
		cp bin/install.xkcd /usr/local/bin/
		echo "The 'install.xkcd' command is now available. You masochist."
	}
	exit
fi

function ishere {
which "$1" >/dev/null 2>&1
}


if ishere apt-get; then
	cp bin/af /usr/local/bin/paf

elif ishere yum; then
	cp bin/yf /usr/local/bin/paf

elif ishere tazpkg; then
	cp bin/tf /usr/local/bin/paf
else
	echo "Unsupported package management system. Try xkcd instead?"
	exit 2
fi

cp bin/pafs /usr/local/bin/

chmod 755 /usr/local/bin/paf{,s}
