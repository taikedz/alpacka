apk:update() {
    sudo apk update
}

apk:clean() {
    sudo apk clean
}

apk:install() {
    sudo apk add "${PAF_packages[@]:-}"
}

apk:remove() {
    sudo apk del "${PAF_packages[@]:-}"
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
    sudo apk upgrade
}

apk:search() {
    apk search "${PAF_packages[@]:-}" | less
}
