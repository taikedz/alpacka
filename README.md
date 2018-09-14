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

The `alpacka` scripts are wrappers around popular package management commands (e.g. `apt`, `yum`, `dnf`, etc) allowing you to issue similar commands on any supported system.

It installs to `/usr/local/bin` as the `paf` command (historical naming reasons lost...) and you just use it in the generally the same way on any of Ubuntu, Fedora, CentOS and SliTaz

For example to install the `htop` and `tmux` commands on Fedora, run

	paf -i htop tmux

To install them on Debian, run

	paf -i htop tmux

To install them on Slitaz, run

	paf -i htop tmux

;-)

## What command ....?

Ever find yourself thinking, "was it `update` or `upgrade` I use here... and is it `install` or `add` or `gi` ...?"

`paf` allows you to just use a standard flag, and forget the details, and you can specify several in one go - for example, to install htop and tmux, after updating the package indeices, and perform a cleanup afterwards, automatically accepting... do:

    paf -i tmux htop -u -c -y

All actions will be carried out on Debian and Ubuntu, on Fedora the index update will be ignored. Less to think about.

See [src/help.sh] for details on all standard flags.

## Supported package managers:

* Debian APT
* Ubuntu APT and PPAs
* Fedora DNF
* Red Hat YUM
* Alpine APK
* OpenSuSE Zypper
* Slitaz Tazpkg

## Warnings

You can also set a warning for any action. Warnings are messages that are displayed before an action is carried out. For each warning, you get a 5 second grace period in which to press `Ctrl+C` to abort, or you can press return to immediately proceed.

To set a warning:
    
    sudo paf -w upgrade "Be careful when upgrading this server - it restarts the core service, which takes a while !"

To unset a warning:

    sudo paf -w upgrade .

To simply view a set warning:

    paf -w upgrade

## Why?

Because I am too lazy to remember which command has what option names; and in some cases to get over some limitations of the package manager itself.

I also forget what servers need special attention when doing system upgrades. Hah.

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
