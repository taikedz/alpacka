apk:update() {
    paf:sudo apk update
}

apk:clean() {
    paf:sudo apk clean
}

apk:install() {
    paf:sudo apk add "${PAF_packages[@]:-}"
}

apk:remove() {
    paf:sudo apk del "${PAF_packages[@]:-}"
}

apk:list() {
    apk info -vv |sort| less || return 0
}

apk:show() {
    local package

    for package in "${PAF_packages[@]:-}"; do
        apk info "$package" | less
    done
}

apk:upgrade() {
    paf:sudo apk upgrade
}

apk:search() {
    apk search "${PAF_packages[@]:-}" | less
}
