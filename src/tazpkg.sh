tazpkg:update() {
    sudo tazpkg recharge
}

tazpkg:clean() {
    sudo tazpkg clean-cache
    sudo tazpkg autoremove
}

tazpkg:install() {
    local pkg
    for pkg in "${PAF_packages[@]:-}"; do
        sudo tazpkg -gi "$pkg"
    done
}

tazpkg:remove() {
    local pkg
    for pkg in "${PAF_packages[@]:-}"; do
        sudo tazpkg remove "$pkg"
    done
}

tazpkg:list() {
    tazpkg list | less || return 0
}

tazpkg:show() {
    local package

    for package in "${PAF_packages[@]:-}"; do
        tazpkg info "$package" | less -R
    done
}

tazpkg:upgrade() {
    sudo tazpkg upgrade
}

tazpkg:search:and() {
    TERM="$1"; shift

    local tazres=$(tazpkg search "$TERM"|egrep -e '-[0-9]')

    while [[ -n "$@" ]]; do
        tazres=$(echo "$tazres" | grep "$1")
        shift
    done
    echo "$tazres"
}

tazpkg:search:or() {
    local tazres=
    while [[ -n "$@" ]]; do
        TERM="$1" ; shift
        tazres="$tazres $(tazpkg search "$TERM"| egrep -e '-[0-9]')"
        shift
    done
    echo "$tazres"|sort
}

tazpkg:search() {
    if bincheck:has "-so" "$@" ; then
        tazpkg:search:or "${PAF_packages[@]:-}" | less
    else
        tazpkg:search:and "${PAF_packages[@]:-}" | less
    fi
}
