### zypper-specific options Usage:help-zypper
#
# -g
#   Upgrade packages
#
# -gR
#   Distribution upgrade
#
###/doc

zypper:assume() {
    if [[ "$PAF_assume" = yes ]]; then
        echo "-y"
    fi
}

zypper:update() {
    :
}

zypper:clean() {
    paf:sudo zypper $(zypper:assume) clean
}

zypper:install() {
    paf:sudo zypper install $(zypper:assume) "${PAF_packages[@]:-}"
}

zypper:remove() {
    paf:sudo zypper remove $(zypper:assume) "${PAF_packages[@]:-}"
}

zypper:list() {
    zypper se --installed-only | grep -v -e 'patch\s*$' | less || return 0
}

zypper:show() {
    local package

    for package in "${PAF_packages[@]:-}"; do
        zypper info "$package" | less
    done
}

zypper:upgrade() {
    if args:has "-gR" "$@"; then
        paf:sudo zypper $(zypper:assume) dist-upgrade
    else
        paf:sudo zypper $(zypper:assume) update
    fi
}

zypper:search() {
    zypper search "${PAF_packages[@]:-}" | less
}
