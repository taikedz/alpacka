# alpacka

Wrappers for package managers

(C) Tai Kedzierski 2016-2018, licensed under the GNU General Public License v3

## Install

	git clone https://github.com/taikedz/alpacka
	sudo alpacka/install.sh

And you're done.

### Dependecies

You probably already have these, unless you're running in some pared-down environment - in which case, ensure the following are installed: `less`, `which`, `grep`, `sudo`, `bash`

# What is it?

The `alpacka` scripts are wrappers around popular package management commands (e.g. `apt`, `yum`, `tazpkg`) allowing you to issue similar commands on any supported system.

It installs to `/usr/local/bin` as the `paf` command (historical naming reasons lost...) and you just use it in the generally the same way on any of Ubuntu, Fedora, CentOS and SliTaz

## Why?

Because I am too lazy to remember which command has what option names; and in some cases to get over some limitations of the package manager itself.

# `pafs`

The `pafs` tool is a search-only tool that will search over every and any package manager you happen to have installed.

It will then display all the results in a `less` session, or you can dump to stdout.

You will need to use the appropriate package manager to perform the installation.

Supported package managers for the `pafs` search utility include:

* apt
* dnf, yum
* pacman
* zypper
* tazpkg
* pip
* cpan
* ruby gem
* more to come...
