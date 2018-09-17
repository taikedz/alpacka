
### Uniform Package Management Wrapper Usage:help
# 
# The `paf` command is a shorthand to allow use of a single package management command across distros.
#
#
# Whether you are runing Ubuntu, Fedora, Arch or other, these commands will all work, and perform the equivalent expected actions.
#
# ## ACTIVITIES AND OPTIONS
#
# Some package managers support independent activites to run before and after main actions.
#
#     -u
#         update the package database
#
#     -c
#         clean up interim packages and cache
#
#     -y
#         assume yes
#
# ACTIONS
# -------
#
# Only one action can be run at a time. The last one specified will be run. For example
#
#   paf -s htop
#
# would show info for htop, whereas
#
#   paf -s htop -i
#
# would install it.
#
#
#
# Search for keywords:
#
#    paf KEYWORDS ...
#
# Show info on each package
#
#    paf -s PACKAGES ...
#
# Install
#
#    paf -i PACKAGES ...
#
# Remove
#     
#     paf -r PACKAGES ...
#
#
#
#
# Examples
# --------
#
# Install 3 packages, after updating the package index if applicable:
#
#   paf -u -i htop vim tmux
#
# Perform a system upgrade, after upgrading the package index (if applicable):
#
#   paf -u -g
#
# Clean out package manager cache:
#
#   paf -c
#
###/doc

