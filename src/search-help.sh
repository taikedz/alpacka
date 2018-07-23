### pafs Usage:help
# 
# Search for packages everywhere!
# 
# (C) Tai Kedzierski, released under GPL v3
# 
# 
# 
# This script was inspired by the "Universal xkcd installer"
# 
# Rather than installing packages however, it searches a wide range of sources, including (as apporpriate):
# 
# 
# * standard repositories for apt, dnf/yum, pacman, tazpkg and emerge systems
# * AUR if yaourt is detected, in which case yaourt search is used instead of pacman
# * Where detected, cpan (this needs to have been initialized first), pear, pip, ruby gems, npm, cargo
# * searches for local .deb and .rpm files depending on detection of apt-get or yum/dnf
# * looks for directories with "Makefile" or "install.sh" files
# * and even performs a basic web search for github repositories
# 
# The results are then displayed in `less`, and you can see which repositories or locations yeilded a result.
# 
# OPTIONS
# 
# --update|-u
#     Whether to run the package list update mechanism, if appropriate
# 
# --filter|-f
#     filter results using a perl-style regular expression (`grep -P`)
# 
# --help|-h
#     Prints this help
# 
# --dump|-d
#     Dump to stdout instead of through less
#
# -e=MANAGER[,MANAGER...]
#     Package managers to exclude, e.g. `-e=docpan,docker,github`
###/doc

### Package manager shortnames Usage:help
#
# Short names for package manager exclusion:
#
#   os                    -- the operating system's package manager, such as apt, yum, pacman, etc
#   pip, gem, npm, docpan
#       pear, cargo       -- language package managers
#   local                 -- local files (.rpm, .deb, Makefile, install.sh)
#   github                -- github.com
#   docker                -- docker
#
# You can set names in your .bashrc to always ignore certain repositories, for example
#
#   export EXCLUDED_MANAGERS="docpan local docker"
#
# will cause `pafs` to never search CPAN, local files, or docker images.
#
###/doc
