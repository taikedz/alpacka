#!/bin/bash

# Identify the distro's package manager

ALPPM=unknown

for x in /usr/bin/{apt-get,dnf,yum,pacman,tazpkg}
do
	if [[ -f "$x" ]]; then
		ALPPM="$(basename "$x")"
		break
	fi
done
