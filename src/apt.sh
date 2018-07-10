### APT-specific options Usage:help-apt-get
#
# APT specific options include
#
# `-gg` - perform a dist-upgrade
#
# `-gR` - perform a release upgrade
#
###/doc

apt-get:assume() {
    if [[ "$PAF_assume" = yes ]]; then
        echo "-y"
    fi
}

apt-get:update() {
    paf:sudo apt-get update
}

apt-get:clean() {
    paf:sudo apt-get $(apt-get:assume) autoclean
    paf:sudo apt-get $(apt-get:assume) autoremove
}

apt-get:install() {
    paf:sudo apt-get install $(apt-get:assume) "${PAF_packages[@]:-}"
}

apt-get:remove() {
    paf:sudo apt-get remove $(apt-get:assume) "${PAF_packages[@]:-}"
}

apt-get:list() {
    dpkg --get-selections | less || return 0
}

apt-get:show() {
    local package

    for package in "${PAF_packages[@]:-}"; do
        apt-cache show "$package" | sed -r 's/^(Package: )/[1;33m===[0m\n\1/' | less -R
    done
}

apt-get:upgrade() {
    if args:has "-gg" "$@" ; then
        paf:sudo apt-get $(apt-get:assume) dist-upgrade
    elif args:has "-gR" "$@"; then
        paf:sudo do-release-upgrade $(apt-get:assume)
    else
        paf:sudo apt-get $(apt-get:assume) upgrade
    fi
}

apt-get:search() {
    apt-cache search "${PAF_packages[@]:-}" | less
}
