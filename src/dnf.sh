dnf:assume() {
    if [[ "$PAF_assume" = yes ]]; then
        echo "-y"
    fi
}

dnf:update() {
    :
}

dnf:clean() {
    sudo "$PAF_pm" clean
    sudo "$PAF_pm" autoremove
}

dnf:install() {
    sudo "$PAF_pm" install $(dnf:assume) "${PAF_packages[@]:-}"
}

dnf:remove() {
    sudo "$PAF_pm" remove $(dnf:assume) "${PAF_packages[@]:-}"
}

dnf:list() {
    sudo "$PAF_pm" list --installed | less
    return 0
}

dnf:show() {
    local package

    for package in "${PAF_packages[@]:-}"; do
        "$PAF_pm" info "$package" | less
    done
}

dnf:upgrade() {
    sudo "$PAF_pm" upgrade
}

dnf:search() {
    dnf search "${PAF_packages[@]:-}" | less
}

yum:update() { dnf:update ; }
yum:clean() { dnf:clean ; }
yum:install() { dnf:install ; }
yum:remove() { dnf:remove ; }
yum:list() { dnf:list ; }
yum:show() { dnf:show ; }
yum:upgrade() { dnf:upgrade ; }
yum:search() { dnf:search ; }
