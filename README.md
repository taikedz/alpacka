# alpacka

Wrapper for package managers - use the same commands on all systems, stay sane.

(C) Tai Kedzierski 2016-2018, licensed under the GNU General Public License v3

## Why ?

A few reasons:

1. All package managers have their idisyncracies even with regard to activities they have in common. Alpacka unifies the workflow.
2. Most package managers don't allow performing multiple associated actions in conjunction (index rebuild, cleanup); Alpacka provides single switches to activate each.
3. Some package managers have limitations, dissociated commands, or complicated syntax - alpacka overcomes the two former, and provides a uniform syntax to get around the latter.
4. No package managers allow setting pre-action warnings - this feature helps avoid butter-fingering an upgrade and downtiming a server unintentionally. Alpacka provides warnings with configurable timeoouts.
5. I'm lazy and don't like retyping a command simply to change one part. Alpacka only runs the last action specified amongst info, install, remove, or system upgrade

## Install

	git clone https://github.com/taikedz/alpacka
	sudo alpacka/install.sh

And you're done.

It installs to `/usr/local/bin` as the `paf` command (historical naming reasons lost...) and you just use it in the generally the same way on any of Ubuntu, Fedora, CentOS and SliTaz

### Dependecies

You probably already have these, unless you're running in some pared-down environment - in which case, ensure the following are installed: `less`, `which`, `grep`, `sudo`, `bash`

# What is it?

The `alpacka` scripts are wrappers around popular package management commands (e.g. `apt`, `yum`, `dnf`, `pacman`, etc) allowing you to issue similar commands on any supported system.

For example to install the `htop` and `tmux` commands on Fedora, run

	paf -i htop tmux

To install them on Debian, run

	paf -i htop tmux

To install them on Arch, run

	paf -i htop tmux

`;-)`

## What command ....?

This is not limited to installation either. Ever find yourself thinking, "was it `update` or `upgrade` I use here... and is it `install` or `add` or `gi` ...?"

`paf` allows you to just use a standard flag, and forget the details, and you can specify several in one go - for example, to install htop and tmux, after updating the package indeices, and perform a cleanup afterwards, automatically accepting... do:

    paf -i tmux htop -u -c -y

All actions will be carried out on Debian and Ubuntu, on Fedora the index update will be ignored. Less to think about.

See [src/help.sh](src/help.sh) for details on all standard flags.

## Get warnings

You can also set a warning for any action. Warnings are messages that are displayed before an action is carried out. For each warning, you get a grace period in which to press `Ctrl+C` to abort, or you can press return to immediately proceed.

To set a warning:
    
    sudo paf -w upgrade "Be careful when upgrading this server - it restarts the core service, which takes a while !"

To unset a warning:

    sudo paf -w upgrade .

To simply view an existing warning:

    paf -w upgrade

The default grace period is 5 seconds. You can configure the grace period to (e.g.) 10 seconds by setting `warning_sleep = 10` in `/etc/alpacka/config.ini`

## Supported package managers:

* Debian APT
* Ubuntu APT and PPAs
* Fedora DNF
* Red Hat YUM
* Alpine APK
* Arch pacman
* OpenSuSE Zypper
* Slitaz Tazpkg

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

Individual package managers or package manager groups can be ignored.
