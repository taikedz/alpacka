dnf:assume() {
    if [[ "$PAF_assume" = yes ]]; then
        echo "-y"
    fi
}

dnf:update() {
    :
}

dnf:clean() {
    paf:sudo "$PAF_pm" clean
    paf:sudo "$PAF_pm" autoremove
}

dnf:install() {
    paf:sudo "$PAF_pm" install $(dnf:assume) "${PAF_packages[@]:-}"
}

dnf:remove() {
    paf:sudo "$PAF_pm" remove $(dnf:assume) "${PAF_packages[@]:-}"
}

dnf:list() {
    paf:sudo "$PAF_pm" list --installed | less
    return 0
}

dnf:show() {
    local package

    for package in "${PAF_packages[@]:-}"; do
        "$PAF_pm" info "$package" | less
    done
}

dnf:upgrade() {
    paf:sudo "$PAF_pm" upgrade
}

dnf:search() {
    "$PAF_pm" search "${PAF_packages[@]:-}" | less
}

yum:update() { dnf:update "$@" ; }
yum:clean() { dnf:clean "$@" ; }
yum:install() { dnf:install "$@" ; }
yum:remove() { dnf:remove "$@" ; }
yum:list() { dnf:list "$@" ; }
yum:show() { dnf:show "$@" ; }
yum:upgrade() { dnf:upgrade "$@" ; }
yum:search() { dnf:search "$@" ; }
