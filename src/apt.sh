#%include ppa.sh

### APT-specific options Usage:help-apt-get
#
# APT specific options include
#
# `-ip` - use first package name as PPA source, install the remaining packages after adding the PPA:
#
#    paf -ip ppa:libreoffice/ppa libreoffice
#
# `-if` - use dependency fix before running installation
#
# ( can use `-ipf` to run both fix and PPA in one )
#
# `-gg` - perform a dist-upgrade
#
# `-gR` - perform a release upgrade
#
# `-rp` - purge
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
    local firstpackage
    firstpackage="${PAF_packages[0]}"

    if [[ "$PAF_flag_install" =~ f ]]; then
        apt-get:fix
    fi

    if [[ "$PAF_flag_install" =~ p ]]; then
        PAF_packages=("${PAF_packages[@]:1}")

        ppa:add "$firstpackage"
        apt-get:update
    fi

    if [[ -n "${PAF_packages[*]}" ]]; then
        paf:sudo apt-get install $(apt-get:assume) "${PAF_packages[@]:-}"
    fi
}

apt-get:fix() {
    paf:sudo apt-get $(apt-get:assume) -f install
}

apt-get:remove() {
    if [[ "$PAF_flag_remove" = "-rp" ]]; then
        paf:sudo apt-get purge $(apt-get:assume) "${PAF_packages[@]:-}"

    else
        paf:sudo apt-get remove $(apt-get:assume) "${PAF_packages[@]:-}"
    fi
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

apt-get:has-release-upgrade() {
    bincheck:has do-release-upgrade || {
        if [[ "$(. /etc/os-release ; echo "$ID")" = ubuntu ]]; then
            out:warn "'ubuntu-release-upgrader-core' required - installing ..."
            paf:sudo apt-get install ubuntu-release-upgrader-core
        else
            out:fail "Only supported on Ubuntu"
        fi
    }
}

apt-get:upgrade() {
    if [[ "$PAF_flag_upgrade" = "-gg" ]] ; then
        paf:sudo apt-get $(apt-get:assume) dist-upgrade

    elif [[ "$PAF_flag_upgrade" = "-gR" ]]; then
        apt-get:has-release-upgrade
        paf:sudo do-release-upgrade $(apt-get:assume)

    else
        paf:sudo apt-get $(apt-get:assume) upgrade
    fi
}

apt-get:search() {
    apt-cache search "${PAF_packages[@]:-}" | less
}
