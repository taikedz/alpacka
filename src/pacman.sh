### pacman-specific options Usage:help-pacman
#
# -c<N> - when cleaning, keep N previous versions of packages
#
#   paf -c2
#
###/doc

PAF_pacman_updated=false

pacman:assume() {
    if [[ "$PAF_assume" = yes ]]; then
        echo "--noconfirm"
    fi
}

pacman:update() {
    paf:sudo pacman -Syy
    PAF_pacman_updated=true
}

pacman:clean() {
    local keepstring keepnum

    bincheck:has paccache || {
        out:warn "You need 'paccache' from 'pacman-contrib' to perform cleans. Installing ..."
        pacman -S pacman-contrib
    }
    
    keepnum="${PAF_flag_clean:2}"
    if [[ "${keepnum:-}" =~ ^[0-9]+$ ]]; then
        keepstring="k$keepnum"
    fi

    paf:sudo paccache $(pacman:assume) -r"${keepstring:-}" # `-rk1` to keep 1 recent level of packages
}

pacman:install() {
    paf:sudo pacman $(pacman:assume) -S "${PAF_packages[@]:-}"
}

pacman:remove() {
    paf:sudo pacman $(pacman:assume) -Rs "${PAF_packages[@]:-}"
}

pacman:list() {
    pacman -Q | less || return 0
}

pacman:show() {
    local package

    for package in "${PAF_packages[@]:-}"; do
        pacman -Si "$package" | less
    done
}

pacman:upgrade() {
    if [[ "$PAF_pacman_updated" = true ]]; then
        paf:sudo pacman $(pacman:assume) -Su
    else
        paf:sudo pacman $(pacman:assume) -Syu
    fi
}

pacman:search() {
    pacman -Ss "${PAF_packages[@]:-}" | less
}
