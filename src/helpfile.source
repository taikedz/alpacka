### alp Usage:help
#
# The `alp` command
# Cross-distro wrapper to give a standardized command
# line utility for searching a number of repositories.
#
# (C) 2017 Tai Kedzierski
# Released under GPLv3
#
# ---------------------------------------------------
#
# (Default)
# Without any switches or options, alp searches packages and
# displays the result in the standard pager in PAGER. If no
# page is specified, uses less. If less is not installed or
# the -O option is supplied, then dumps to stdout.
#
# Where multiple terms are specified, results returned
# depend on how the package manager handles this:
#
# 	apt : looks for all terms in the name and description
# 	yum/dnf : looks for all terms in the name and description
# 	tazpkg : search for the first term, and filter on the remainder
# 	pacman : (tbd)
#
#
# Standard commands
# -----------------
#
# If several of these command switches are specified, only the last one
# will be applied.
#
# -s|--show PACKAGE
# 	Show the information for a single package
#
# -l |--list
# 	List the installed packages
#
# -i|--install PACKAGES ...
# 	Install the specified packages.
#
# 	If an operation is currently underway, the packages are added
# 	to a waiting list.
#
# -g|--upgrade [PACKAGES ...]
# 	Upgrade the specified packages.
#
# 	If no packages are specified, updates all packages.
#
# 	If an operation is currently underway, the action is queued
#
# -a|--add-repository
# 	Add a repository in systems which allow it (yum/dnf and apt supported)
#
#
# Additional commands
# -------------------
#
# -u|--update
# 	Update the local cache before running the main command.
# 	Does not apply to yum/dnf
#
# -c|--clean
# 	Cleans the cache of packages (apt only?)
#
# -O|--stdout
# 	Forcibly dump to stdout
#
# 	You can specify a custom pager by setting the
# 	PAGER environment variable.
#
#
# Additional Package Management Systems
# =====================================
#
# It is possible to specify other repositories to search on top of the
# main distro repositories. 
#
# -D|--no-distro-package-manager
# 	Switch off search on the default package manager
#
# To specify other package managers to search, populate a colon-
# separated list from the following list into ALPACKAS
#
# * cpan -- search Perl's CPAN packages
# * pip -- search Python's pip packages
# * compose -- search PHP's Composer packages
# * gem -- seach Ruby's Gems
# * node -- search Nod.js's packages
# * aur -- use the Arch User Repository
#
# For example, to search for a markdown package in pip and node, and
# not in the distro's normal package manager:
#
# 	ALPACKAS=pip:node alp -D markdown
#
# Only search, show and install actions are guaranteed to work for
# additional package management systems.
#
###/doc
