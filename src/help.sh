
### PAF installer Usage:help
# 
# The `paf` command is a shorthand to allow use of a single command across distros.
#
# Run `paf` and let it determine whether to invoke apt-get, dnf or yum.
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
###/doc

