# alpacka

Wrappers for package managers

(C) Tai Kedzierski 2016, licensed under the GNU General Public License v3

# What is it?

The `alpacka` scripts are wrappers around popular package management commands (e.g. `apt`, `yum`, `tazpkg`) allowing you to issue similar commands on any supported system.

It installs to `/usr/local/bin` as the `paf` command (historical naming reasons lost...) and you just use it in the generally the same way on any of Ubuntu, Fedora, CentOS and SliTaz

## Why?

Because I am too lazy to remember which command has what option names; and in some cases to get over some limitations of the package manager itself.

## Ubuntu support, and Debian

My wrapper wraps around the `apt` command, which offers some nice features regarding output display (the only reason, really). I'll get round to elegantly adding "apt-get" usage instead soon.
