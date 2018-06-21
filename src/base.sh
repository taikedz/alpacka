%PM%:assume() {
    if [[ "$PAF_assume" = yes ]]; then
        echo "-y"
    fi
}

%PM%:update() {
    sudo %PM% update
}

%PM%:clean() {
    sudo %PM% $(%PM%:assume) clean
}

%PM%:install() {
    sudo %PM% install $(%PM%:assume) "${PAF_packages[@]:-}"
}

%PM%:remove() {
    sudo %PM% remove $(%PM%:assume) "${PAF_packages[@]:-}"
}

%PM%:list() {
    %PM% list | less || return 0
}

%PM%:show() {
    local package

    for package in "${PAF_packages[@]:-}"; do
        %PM% show "$package" | less
    done
}

%PM%:upgrade() {
    sudo %PM% $(%PM%:assume) upgrade
}

%PM%:search() {
    %PM% search "${PAF_packages[@]:-}" | less
}
